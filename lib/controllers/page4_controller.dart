import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trafic_static_app/constants/links.dart';
import 'package:trafic_static_app/core/network/dio_helper.dart';
import 'package:trafic_static_app/model/traffic_by_countries_model.dart';

class Page4Controller extends GetxController{
  RxBool isLoading = true.obs;
  final Rx<TrafficByCountriesModel> _trafficByCountryModel = TrafficByCountriesModel().obs;
  TrafficByCountriesModel get trafficByCountryModel => _trafficByCountryModel.value;
  @override
  void onInit() async {
    super.onInit();
    Future.wait([getTrafficByCountry()]).then((value) {
      isLoading.value = false;
    });

  }

  Future<void> getTrafficByCountry() async {
    DioHelper.init();
    await DioHelper.postData(
        url: getTrafficCountries,
        query: {},
        data: {"start":0,"length":100})
        .then((value) {
      if (value.statusCode == 200) {
        try {
          _trafficByCountryModel.value =
              TrafficByCountriesModel.fromJson(jsonDecode(value.data.toString()));
          debugPrint('getTrafficByCountry Success ${value.data}');
        } on Exception catch (_) {
          _trafficByCountryModel.value = TrafficByCountriesModel.fromJson(value.data);
          debugPrint('getTrafficByCountry Success ${value.data}');
        }
      }
    }).catchError((e) {
      debugPrint('getTrafficByCountry error $e');
      // isLoading.value = false;
    });
  }
}