import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:trafic_static_app/constants/links.dart';
import 'package:trafic_static_app/core/network/dio_helper.dart';
import 'package:trafic_static_app/model/browsers_data_model.dart';
import 'package:trafic_static_app/model/sample_view.dart';
import 'package:trafic_static_app/model/search_engins_model.dart';

class Page5Controller extends GetxController{
  RxBool isLoading = true.obs;

  final Rx<BrowsersDataModel> _browserModel = BrowsersDataModel().obs;
  BrowsersDataModel get browsersDataModel => _browserModel.value;

  final Rx<SearchEnginsModel> _searchEngineModel = SearchEnginsModel().obs;
  BrowsersDataModel get searchEngineModel => _browserModel.value;

  RxList<ChartSampleData>? browsersData = RxList<ChartSampleData>();
  RxList<ChartSampleData>? searchEnginesData = RxList<ChartSampleData>();
  @override
  void onInit() async {
    super.onInit();
    Future.wait([getBrowsersData(),getSearchEnginesData()]).then((value) {
      isLoading.value = false;
    });

  }

  Future<void> getBrowsersData() async {
    DioHelper.init();
    await DioHelper.getData(
        url: getBrowsers,
        query: {},)
        .then((value) {
      if (value.statusCode == 200) {
        debugPrint('getBrowsersData data ${value.data}');

        try {
          _browserModel.value =
              BrowsersDataModel.fromJson(jsonDecode(value.data.toString()));
          debugPrint('getBrowsersData Success ${value.data}');
          browsersDataModel.data!.data2!.data3!.forEach((element) {
            browsersData!.add(ChartSampleData(
                x: '${element.bsrName}', y: int.parse(element.hits!)
            ));
          });
        } on Exception catch (_) {
          _browserModel.value = BrowsersDataModel.fromJson(value.data);
          browsersDataModel.data!.data2!.data3!.forEach((element) {
            browsersData!.add(ChartSampleData(
                x: '${element.bsrName}', y: int.parse(element.hits!)
            ));
          });
          debugPrint('getBrowsersData Success ${value.data}');
        }
      }
    }).catchError((e) {
      debugPrint('getBrowsersData error $e');
    });
  }

  Future<void> getSearchEnginesData() async {
    DioHelper.init();
    await DioHelper.getData(
      url: getSearchEngine,
      query: {},)
        .then((value) {
      if (value.statusCode == 200) {
        try {
          _searchEngineModel.value =
              SearchEnginsModel.fromJson(jsonDecode(value.data.toString()));
          debugPrint('getSearchEngine Success ${value.data}');
        } on Exception catch (_) {
          _searchEngineModel.value = SearchEnginsModel.fromJson(value.data);
          _searchEngineModel.value.data!.data!.forEach((element) {
            searchEnginesData!.add(ChartSampleData(
                x: '${element.title}', y: int.parse(element.value!)
            ));
          });
          debugPrint('getSearchEngine Success ${value.data}');
        }
      }
    }).catchError((e) {
      debugPrint('getSearchEngine error $e');
    });
  }
}