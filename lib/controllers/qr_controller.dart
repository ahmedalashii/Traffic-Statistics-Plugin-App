import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:trafic_static_app/constants/links.dart' as links;
import 'package:trafic_static_app/core/network/dio_helper.dart';

class QrController extends GetxController{

  static Future<void> saveDeviceData({
    required String deviceId,
    required String deviceName,
    required String deviceModel,
    required String userId,
  }) async {
    DioHelper.init();
    await DioHelper.postData(
      url: links.saveDeviceData,
      query: {},
      data: {
        "deviceId":deviceId,
        "deviceName":deviceName,
        "deviceModel":deviceModel,
        "userId":userId,
      },
    ).then((value) {
      if (value.statusCode == 200) {
        debugPrint('saveDeviceData Success ${value.data}');
       //   showToast(value.data['message']);
      }
    }).catchError((e) {
      debugPrint('saveDeviceData error $e');
    });
  }
}