import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:trafic_static_app/constants/links.dart';
import 'package:trafic_static_app/core/network/dio_helper.dart';
import 'package:trafic_static_app/model/top_statics_model.dart';
import 'package:trafic_static_app/model/traffic_report_model.dart';

class TrafficsController extends GetxController {
  final Rx<TrafficReportModel> _trafficReportModel = TrafficReportModel().obs;
  final Rx<TopStaticsModel> _topStaticsModel = TopStaticsModel().obs;
  RxBool isError = false.obs;
  TrafficReportModel get trafficReportModel => _trafficReportModel.value;
  TopStaticsModel get topStaticModel => _topStaticsModel.value;

  RxBool isLoading = true.obs;

  @override
  void onInit() async {
    isLoading.value = true;
    super.onInit();
      Future.wait([getTrafficReportData(), getTopStatics()]).then((value) {
        isLoading.value = false;
      });

  }


  Future<void> getTrafficReportData() async {
    DioHelper.init();
    var now = DateFormat('yyyy-MM-dd').format(DateTime.now());
    var last14Day = DateFormat('yyyy-MM-dd').format(DateTime.now().subtract(const Duration(days: 14)));
    await DioHelper.postData(
            url: getTrafficReport,
            query: {},
            data: {"start_date":last14Day, "end_date":  now})
        .then((value) {
      if (value.statusCode == 200) {
        try {

          _trafficReportModel.value =
              TrafficReportModel.fromJson(jsonDecode(value.data.toString()));
          isError.value = false;

          debugPrint('getTrafficReportData Success ${value.data}');
          // isLoading.value = false;
        } on Exception catch (_) {
          _trafficReportModel.value = TrafficReportModel.fromJson(value.data);
          debugPrint('getTrafficReportData Success ${value.data}');
          //isLoading.value = false;
        }
      }
    }).catchError((e) {
      debugPrint('getTrafficReportData error $e');
      if(e is DioError){
        isError.value = true;
      }
      // isLoading.value = false;
    });
  }

  Future<void> getTopStatics() async {
    DioHelper.init();
    debugPrint('getTopStatics');
    await DioHelper.getData(
      url: getTop,
      query: {},
    ).then((value) {
      if (value.statusCode == 200) {
        try {
          _topStaticsModel.value =
              TopStaticsModel.fromJson(jsonDecode(value.data.toString()));
          debugPrint('getTopStatics Success ${value.data}');
        } on Exception catch (_) {
          _topStaticsModel.value = TopStaticsModel.fromJson(value.data);
          debugPrint('getTopStatics Success ${value.data}');
        }
      }
    }).catchError((e) {
      debugPrint('getTopStatics error $e');
      // isLoading.value = false;
    });
  }


  @override
  void onReady() {
    super.onReady();
    print("onReady");
  }
}
