import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:trafic_static_app/constants/links.dart' as links;
import 'package:trafic_static_app/core/network/dio_helper.dart';
import 'package:trafic_static_app/model/top_referring_sites_model.dart';
import 'package:trafic_static_app/model/visits_time_model.dart';

class Page7Controller extends GetxController{
  RxBool isLoading = true.obs;
  final Rx<TopReferringSitesModel> _topReferringSitesModel = TopReferringSitesModel().obs;
  TopReferringSitesModel get topReferringSitesModel => _topReferringSitesModel.value;

  final Rx<VisitsTimeModel> _visitsTimeModel = VisitsTimeModel().obs;
  VisitsTimeModel get visitsTimeModel => _visitsTimeModel.value;

  @override
  void onInit() async {
    super.onInit();
    Future.wait([getTopReferringSites(),getVisitsTimeGraph()],).then((value) {
      isLoading.value = false;
    });

  }

  Future<void> getTopReferringSites() async {
    DioHelper.init();
    await DioHelper.getData(
        url: links.getTopReferringSites,
        query: {},)
        .then((value) {
      if (value.statusCode == 200) {
        try {
          _topReferringSitesModel.value =
              TopReferringSitesModel.fromJson(jsonDecode(value.data.toString()));
          debugPrint('getTopReferringSites Success ${value.data}');
        } on Exception catch (_) {
          _topReferringSitesModel.value = TopReferringSitesModel.fromJson(value.data);
          debugPrint('getTopReferringSites Success ${value.data}');
        }
      }
    }).catchError((e) {
      debugPrint('getTopReferringSites error $e');
      // isLoading.value = false;
    });
  }

  Future<void> getVisitsTimeGraph() async {

    var now = DateFormat('MM-dd-yyyy').format(DateTime.now());
    var last14Day = DateFormat('MM-dd-yyyy').format(DateTime.now().subtract(const Duration(days: 14)));
    DioHelper.init();
    await DioHelper.postData(
      url: links.getVisitsGraph,
      data: {"start":0,"length":20,"start_date":now,"end_date":now},
      query: {},)
        .then((value) {
      if (value.statusCode == 200) {
        try {
          _visitsTimeModel.value =
              VisitsTimeModel.fromJson(jsonDecode(value.data.toString()));
          debugPrint('getVisitsTimeGraph Success ${value.data}');
        } on Exception catch (_) {
          _visitsTimeModel.value = VisitsTimeModel.fromJson(value.data);
          debugPrint('getVisitsTimeGraph Success ${value.data}');
        }
      }
    }).catchError((e) {
      debugPrint('getVisitsTimeGraph error $e');
    });
  }
}