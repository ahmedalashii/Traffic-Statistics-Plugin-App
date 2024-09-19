import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:trafic_static_app/constants/links.dart';
import 'package:trafic_static_app/core/network/dio_helper.dart';
import 'package:trafic_static_app/model/last_search_words.dart';
import 'package:trafic_static_app/model/traffic_by_title_model.dart';

class Page9Controller extends GetxController{
  RxBool isLoading = true.obs;
  final Rx<TrafficByTitleModel> _trafficByTitleModel = TrafficByTitleModel().obs;
  TrafficByTitleModel get trafficByTitleModel => _trafficByTitleModel.value;

  final Rx<LastSearchWordsModel> _lastSearchWordsModel = LastSearchWordsModel().obs;
  LastSearchWordsModel get lastSearchWordsModel => _lastSearchWordsModel.value;
  @override
  void onInit() async {
    super.onInit();
    Future.wait([getTrafficByTitle(),getLastSearchWords()]).then((value) {
      isLoading.value = false;
    });

  }

  Future<void> getTrafficByTitle() async {
    DioHelper.init();
    await DioHelper.postData(
        url: getTrafficTitle,
        query: {},
        data: {"start":0,"length":100})
        .then((value) {
      if (value.statusCode == 200) {
        try {
          _trafficByTitleModel.value =
              TrafficByTitleModel.fromJson(jsonDecode(value.data.toString()));
          debugPrint('getTrafficByTitle Success ${value.data}');
        } on Exception catch (_) {
          _trafficByTitleModel.value = TrafficByTitleModel.fromJson(value.data);
          debugPrint('getTrafficByTitle Success ${value.data}');
        }
      }
    }).catchError((e) {
      debugPrint('getTrafficByCountry error $e');
      // isLoading.value = false;
    });
  }

  Future<void> getLastSearchWords() async {
    DioHelper.init();
    await DioHelper.postData(
        url: getLastSearch,
        query: {},
        data: {"start":0,"length":100})
        .then((value) {
      if (value.statusCode == 200) {
        try {
          _lastSearchWordsModel.value =
              LastSearchWordsModel.fromJson(jsonDecode(value.data.toString()));
          debugPrint('getLastSearchWords Success ${value.data}');
        } on Exception catch (_) {
          _lastSearchWordsModel.value = LastSearchWordsModel.fromJson(value.data);
          debugPrint('getLastSearchWords Success ${value.data}');
        }
      }
    }).catchError((e) {
      debugPrint('getLastSearchWords error $e');
    });
  }
}