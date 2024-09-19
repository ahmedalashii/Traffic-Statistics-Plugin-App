import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:trafic_static_app/constants/links.dart';
import 'package:trafic_static_app/core/network/dio_helper.dart';
import 'package:trafic_static_app/model/popup_model.dart';
import 'package:trafic_static_app/model/visitors_by_id_model.dart';

class Page3Controller extends GetxController{
  RxBool isLoading = true.obs;
  final Rx<VisitorsByIdModel> _visitorsModel = VisitorsByIdModel().obs;
  VisitorsByIdModel get visitorsModel => _visitorsModel.value;

  final Rx<PopupModel> _popUpModel = PopupModel().obs;
  PopupModel get popUpModel => _popUpModel.value;
  @override
  void onInit() async {
    super.onInit();
    Future.wait([getVisitorsById()]).then((value) {
      isLoading.value = false;
    });

  }

  Future<void> getVisitorsById() async {
    DioHelper.init();

    var now = DateFormat('MM-dd-yyyy').format(DateTime.now());
    var last14Day = DateFormat('MM-dd-yyyy')
        .format(DateTime.now().subtract(const Duration(days: 14)));

    await DioHelper.postData(
        url: getVisitorsId,
        query: {},
        data: {"start":0,"length":100,"start_date":last14Day,"end_date":now})
        .then((value) {
      if (value.statusCode == 200) {
        try {
          _visitorsModel.value =
              VisitorsByIdModel.fromJson(jsonDecode(value.data.toString()));
          debugPrint('getVisitorsById Success ${value.data}');
        } on Exception catch (_) {
          _visitorsModel.value = VisitorsByIdModel.fromJson(value.data);
          debugPrint('getVisitorsById Success ${value.data}');
        }
      }
    }).catchError((e) {
      debugPrint('getVisitorsById error $e');
      // isLoading.value = false;
    });
  }

  Future<void> getPopUp(String hitIp,String ctrName,String hitDate) async {
    DioHelper.init();
    await DioHelper.postData(
        url: getPopUpHits,
        query: {},
        data: {"hit_ip_address":hitIp,"ctr_name_ahc_city":ctrName,"hit_date":hitDate})
        .then((value) {
      if (value.statusCode == 200) {
        try {
          debugPrint('getPopUp Success ${value.data}');

          _popUpModel.value =
              PopupModel.fromJson(jsonDecode(value.data.toString()));
        } on Exception catch (_) {
          debugPrint('getPopUp Success ${value.data}');
          _popUpModel.value = PopupModel.fromJson(value.data);
        }
      }
    }).catchError((e) {
      debugPrint('getPopUp error $e');
      // isLoading.value = false;
    });
  }
}