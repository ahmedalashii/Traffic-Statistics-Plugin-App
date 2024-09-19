import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:trafic_static_app/constants/links.dart';
import 'package:trafic_static_app/core/network/dio_helper.dart';
import 'package:trafic_static_app/model/map_data_model.dart';
import 'package:trafic_static_app/model/summary_traffic_model.dart';

class Page2Controller extends GetxController {
  final Rx<MapDataModel> _mapDataModel = MapDataModel().obs;
  final Rx<SummaryTrafficModel> _summaryStaticsModel =
      SummaryTrafficModel().obs;
  Rx<MapDataModel> get mapDataModel => _mapDataModel;
  SummaryTrafficModel get summaryStaticsModel => _summaryStaticsModel.value;
  RxBool isLoading = true.obs;
  RxList<Marker> markers = RxList<Marker>();

  @override
  void onInit() async {
    super.onInit();
    Future.wait([getMapData(), getSummaryStatics()]).then((value) {
      isLoading.value = false;
    });
  }

  Future<void> getMapData() async {
    DioHelper.init();
    await DioHelper.getData(
      url: getMap,
      query: {},
    ).then((value) {
      if (value.statusCode == 200) {
        debugPrint('Map Data ${value.data}');
        try {
          _mapDataModel.value =
              MapDataModel.fromJson(jsonDecode(value.data.toString()));
          markers = _mapDataModel.value.data!.map!
              .map(
                (e) {
                  return Marker(
                    point: LatLng(
                      double.parse(e.latitude!),
                      double.parse(e.longitude!),
                    ),
                    child: InkWell(
                      onTap: () {
                        ScaffoldMessenger.of(Get.context!).showSnackBar(
                          SnackBar(
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.network('${e.flags}'),
                                Text('${e.ctrName}'),
                              ],
                            ),
                          ),
                        );
                      },
                      child: Image.asset('images/gps.png'),
                    ),
                  );
                },
              )
              .toList()
              .obs;
        } on Exception catch (_) {
          _mapDataModel.value = MapDataModel.fromJson(value.data);
          markers = _mapDataModel.value.data!.map!
              .map((e) {
                return Marker(
                  point: LatLng(
                      double.parse(e.latitude!), double.parse(e.longitude!)),
                  child: InkWell(
                    onTap: () {
                      ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
                          content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.network('${e.flags}'),
                          Text('${e.ctrName}'),
                        ],
                      )));
                    },
                    child: Image.asset('images/gps.png'),
                  ),
                );
              })
              .toList()
              .obs;
          debugPrint('getMapData Success ${value.data}');
        }
      }
    }).catchError((e) {
      debugPrint('getMapData error $e');
      // isLoading.value = false;
    });
  }

  Future<void> getSummaryStatics() async {
    DioHelper.init();
    await DioHelper.getData(
      url: getSummary,
      query: {},
    ).then((value) {
      if (value.statusCode == 200) {
        try {
          _summaryStaticsModel.value =
              SummaryTrafficModel.fromJson(jsonDecode(value.data.toString()));
          debugPrint('getSummaryStatics Success ${value.data}');
        } on Exception catch (_) {
          _summaryStaticsModel.value = SummaryTrafficModel.fromJson(value.data);
          debugPrint('getSummaryStatics Success ${value.data}');
        }
      }
    }).catchError((e) {
      debugPrint('getSummaryStatics error $e');
      // isLoading.value = false;
    });
  }
}
