import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:trafic_static_app/constants/links.dart';
import 'package:trafic_static_app/core/network/dio_helper.dart';
import 'package:trafic_static_app/model/sample_view.dart';
import 'package:trafic_static_app/model/top_refering_countries_model.dart';
import 'package:trafic_static_app/model/traffic_by_contry_model.dart';

class Page6Controller extends GetxController {
  RxBool isLoading = true.obs;

  final Rx<TopReferingCountriesModel> _topReferringCountriesModel =
      TopReferingCountriesModel().obs;

  TopReferingCountriesModel get topReferringCountriesModel =>
      _topReferringCountriesModel.value;
  final Rx<TrafficByContryModel> _trafficByCountryModel =
      TrafficByContryModel().obs;

  TrafficByContryModel get trafficByCountryModel =>
      _trafficByCountryModel.value;
  RxList<ChartSampleData>? referringCountriesData = RxList<ChartSampleData>();
  RxList<ChartSampleData>? searchEnginesData = RxList<ChartSampleData>();

  @override
  void onInit() async {
    super.onInit();
    Future.wait([getReferringCountries(), getTrafficByCountry()]).then((value) {
      isLoading.value = false;
    });
  }

  Future<void> getReferringCountries() async {
    DioHelper.init();
    await DioHelper.getData(
      url: getReferring,
      query: {},
    ).then((value) {
      if (value.statusCode == 200) {
        try {
          _topReferringCountriesModel.value =
              TopReferingCountriesModel.fromJson(
                  jsonDecode(value.data.toString()));
          for (var element in topReferringCountriesModel.data!.data2!.data3!) {
            referringCountriesData!.add(ChartSampleData(
                x: '${element.ctrName}', y: int.parse(element.visitors!)));
          }

          debugPrint('getReferingCountries Success ${value.data}');
        } on Exception catch (_) {
          _topReferringCountriesModel.value =
              TopReferingCountriesModel.fromJson(value.data);
          for (var element in topReferringCountriesModel.data!.data2!.data3!) {
            referringCountriesData!.add(ChartSampleData(
                x: '${element.ctrName}', y: int.parse(element.visitors!)));
          }
          debugPrint('getReferingCountries Success ${value.data}');
        }
      }
    }).catchError((e) {
      debugPrint('getReferingCountries error $e');
    });
  }

  Future<void> getTrafficByCountry() async {
    DioHelper.init();
    var now = DateFormat('MM-dd-yyyy').format(DateTime.now());
    // var last14Day = DateFormat('MM-dd-yyyy')
    //     .format(DateTime.now().subtract(const Duration(days: 14)));
    await DioHelper.postData(url: getTrafficCountry, query: {}, data: {
      "start": 0,
      "length": 100,
      "start_date": now,
      "end_date": now
    }).then((value) {
      if (value.statusCode == 200) {
        try {
          _trafficByCountryModel.value =
              TrafficByContryModel.fromJson(jsonDecode(value.data.toString()));
          debugPrint('getTrafficByCountry Success ${value.data}');
        } on Exception catch (_) {
          _trafficByCountryModel.value =
              TrafficByContryModel.fromJson(value.data);
          debugPrint('getTrafficByCountry Success ${value.data}');
        }
      }
    }).catchError((e) {
      debugPrint('getTrafficByCountry error $e');
      // isLoading.value = false;
    });
  }
}
