import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart' hide Barcode;

import 'package:trafic_static_app/constants/colors.dart';
import 'package:trafic_static_app/controllers/qr_controller.dart';
import 'package:trafic_static_app/core/cache_controller.dart';
import 'package:trafic_static_app/core/helper/global_functions.dart';
import 'package:trafic_static_app/model/qr_response_model.dart';
import 'package:trafic_static_app/view/widgets/primary_button.dart';
import 'package:trafic_static_app/view/widgets/primary_text.dart';
import 'choose_website_screen.dart';

class QRViewExample extends StatefulWidget {
  const QRViewExample({Key? key}) : super(key: key);

  @override
  State<QRViewExample> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  bool isProcessing = false;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller?.pauseCamera();
    }
    controller?.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(flex: 4, child: _buildQrView(context)),
          Expanded(
            flex: 1,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  PrimaryText('Scan a code', fontSize: 30.sp),
                  Padding(
                    padding: EdgeInsets.all(20.h),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 90.h,
                          width: Get.width - 30,
                          child: FutureBuilder(
                            future: controller?.getFlashStatus(),
                            builder: (context, snapshot) => PrimaryButton(
                              title: 'Flash: ${snapshot.data ?? "false"}',
                              fontSize: 26,
                              color: primaryColor,
                              onPressed: () async {
                                await controller?.toggleFlash();
                                setState(() {});
                              },
                            ),
                          ),
                        ),
                        SizedBox(width: 15.w),
                        SizedBox(
                          height: 90.h,
                          width: Get.width - 30,
                          child: PrimaryButton(
                            title: 'Flip Camera',
                            color: primaryColor,
                            fontSize: 26,
                            onPressed: () async {
                              await controller?.flipCamera();
                              setState(() {});
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;

    return Stack(
      children: [
        QRView(
          key: qrKey,
          onQRViewCreated: _onQRViewCreated,
          overlay: QrScannerOverlayShape(
            borderColor: Colors.red,
            borderRadius: 10,
            borderLength: 30,
            borderWidth: 10,
            cutOutSize: scanArea,
          ),
          onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
        ),

        /// زر اختيار من الاستوديو
        PositionedDirectional(
          bottom: 40,
          start: 20,
          child: IconButton(
            icon: const Icon(Icons.add_photo_alternate_rounded,
                color: Colors.white, size: 30),
            onPressed: () async {
              await _scanFromGallery();
            },
          ),
        ),
      ],
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;

    controller.scannedDataStream.listen((scanData) async {
      if (isProcessing) return;

      isProcessing = true;

      final code = scanData.code;
      if (code != null) {
        await _handleScannedCode(code);
      }
    });
  }

  /// 🔥 دالة موحدة للمعالجة
  Future<void> _handleScannedCode(String code) async {
    try {
      final parsed = QrResponseModel.fromJson(jsonDecode(code));

      await CacheController.instance.setWebsite(jsonEncode(parsed));

      List<QrResponseModel>? websites =
          CacheController.instance.getWebsitesArray();

      websites ??= [];
      websites.add(parsed);

      CacheController.instance
          .setWebsitesArray(QrResponseModel.encode(websites));

      var website = CacheController.instance.getWebsite();

      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

      showLoaderDialog(context);

      if (Platform.isAndroid) {
        var androidInfo = await deviceInfo.androidInfo;

        await QrController.saveDeviceData(
          deviceId: androidInfo.id,
          deviceName: androidInfo.device,
          deviceModel: androidInfo.model,
          userId: website!.userID.toString(),
        );

        CacheController.instance.setDeviceId(androidInfo.id);
      } else if (Platform.isIOS) {
        var iosInfo = await deviceInfo.iosInfo;

        await QrController.saveDeviceData(
          deviceId: iosInfo.identifierForVendor,
          deviceName: iosInfo.name,
          deviceModel: iosInfo.model,
          userId: website!.userID.toString(),
        );

        CacheController.instance.setDeviceId(iosInfo.identifierForVendor);
      }

      Navigator.pop(context);

      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const ChooseWebsiteScreen()),
        (route) => false,
      );

      controller?.dispose();
    } catch (e) {
      log("QR Error: $e");
      Get.snackbar("Error", "Invalid QR Code");
    }
  }

  /// 📸 قراءة من الصورة
  Future<void> _scanFromGallery() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);

    if (image == null) return;

    final mobileController = MobileScannerController();

    final barcode = await mobileController.analyzeImage(image.path);

    if (barcode != null && barcode.barcodes.isNotEmpty) {
      final code = barcode.barcodes.first.rawValue;

      if (code != null) {
        await _handleScannedCode(code);
      }
    } else {
      Get.snackbar("Error", "No QR code found");
    }
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()} Permission: $p');

    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No Permission Accepted!')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
