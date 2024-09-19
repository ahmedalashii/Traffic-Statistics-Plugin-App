
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trafic_static_app/constants/links.dart' as links;
import 'package:trafic_static_app/constants/links.dart';
import 'package:trafic_static_app/core/network/dio_helper.dart';
import 'package:trafic_static_app/model/settings_model.dart';
class SettingsController extends GetxController{
  RxBool isLoading = true.obs;
  final Rx<SettingsModel> _settingsModel = SettingsModel().obs;
  SettingsModel get settingsModel => _settingsModel.value;
  RxBool isError = false.obs;

  @override
  void onInit() async {
    super.onInit();
    Future.wait([getSettings()],).then((value) {
      isLoading.value = false;
    });

  }

  Future<void> getSettings() async {
    DioHelper.init();
    await DioHelper.getData(
      url: links.getSettings,
      query: {},)
        .then((value) {
      if (value.statusCode == 200) {
        print(value.data.toString());
        try {
          _settingsModel.value =
              SettingsModel.fromJson(jsonDecode(value.data.toString()));
          print('getSettings Success ${value.data}');
        } on Exception catch (_) {
          print('Exception');
          _settingsModel.value = SettingsModel.fromJson(value.data);
          print('getSettings Success ${_settingsModel.value.data!.data2!.selectTimezone!.value}');
        }
      }
    }).catchError((e) {
      debugPrint('getSettings error $e');
      // isLoading.value = false;
    });
  }


  Future<void> setSettings(
  {
  required String timeZone,
  required String ipToExclude,
  required String pluginAccess,
  required String mapWillDisplay,
}
      ) async {
    DioHelper.init();
    await DioHelper.postData(
        url: links.setSettings,
        query: {},
        data: {
          "set_custom_timezone":timeZone,
          "set_ips":ipToExclude,
          "ahcproUserRoles":pluginAccess,
          "set_google_map":mapWillDisplay,

        })
        .then((value) {
      if (value.statusCode == 200) {
        isError.value = false;
        debugPrint('setSettings Success ${value.data}');
      }
    }).catchError((e) {
      isError.value = true;
      debugPrint('setSettings error $e');
      // isLoading.value = false;
    });
  }
}