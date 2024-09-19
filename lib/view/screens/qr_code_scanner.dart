import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:qr_code_scanner/qr_code_scanner.dart';
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
  State<StatefulWidget> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
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
                  PrimaryText(
                    'Scan a code',
                    fontSize: 30.sp,
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 90.h,
                          width: Get.width - 30,
                          child: FutureBuilder(
                            future: controller?.getFlashStatus(),
                            builder: (context, snapshot) => PrimaryButton(
                              title: 'Flash: ${snapshot.data}',
                              fontSize: 26,
                              color: primaryColor,
                              onPressed: () async {
                                await controller?.toggleFlash();
                                setState(() {});
                              },
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 35,
                        ),
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
                              }),
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
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });

    controller.scannedDataStream.listen((scanData) {
      if (result == null) {
        setState(() async {
          result = scanData;
          debugPrint(result!.code);
          await CacheController.instance.setWebsite(jsonEncode(
              QrResponseModel.fromJson(jsonDecode('${result!.code}'))));
          List<QrResponseModel>? websites =
              CacheController.instance.getWebsitesArray();
          websites!
              .add(QrResponseModel.fromJson(jsonDecode('${result!.code}')));
          CacheController.instance
              .setWebsitesArray(QrResponseModel.encode(websites));
          var website = CacheController.instance.getWebsite();
          debugPrint("element.apiUrl " + websites[0].apiUrl.toString());
          DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
          if (Platform.isAndroid) {
            AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
            CacheController.instance.setDeviceId(androidInfo.id);

            showLoaderDialog(context);
            await QrController.saveDeviceData(
              deviceId: androidInfo.id,
              deviceName: androidInfo.device,
              deviceModel: androidInfo.model,
              userId: website!.userID.toString(),
            ).then((value) {
              Navigator.pop(context);
            }).then((value) {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (context) => const ChooseWebsiteScreen()),
                  (Route<dynamic> route) => false);
            });
          } else if (Platform.isIOS) {
            IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
            await QrController.saveDeviceData(
              deviceId: iosInfo.identifierForVendor,
              deviceName: iosInfo.name,
              deviceModel: iosInfo.model,
              userId: website!.userID.toString(),
            ).then((value) {
              Navigator.pop(context);
            }).then((value) {
              CacheController.instance.setDeviceId(iosInfo.identifierForVendor);
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (context) => const ChooseWebsiteScreen()),
                  (Route<dynamic> route) => false);
            });
          }
          this.controller!.dispose();
          controller.dispose();
        });
      } else {
        dispose();
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (context) => const ChooseWebsiteScreen()),
            (Route<dynamic> route) => false);
      }
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No Permission Accepted !')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
