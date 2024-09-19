import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:trafic_static_app/constants/values.dart';

import '../cache_controller.dart';

class DioHelper {
  static late Dio dio;
  int index = CacheController.instance.getIndex();


  static String baseUrl =
      CacheController.instance.getWebsitesArray()![websiteIndex].apiUrl! ;
  static String key = CacheController.instance.getWebsitesArray()![websiteIndex].key!;
  static int userId = CacheController.instance.getWebsitesArray()![websiteIndex].userID!;


  static init() async{
    baseUrl =
    CacheController.instance.getWebsitesArray()![websiteIndex].apiUrl! ;
    key = CacheController.instance.getWebsitesArray()![websiteIndex].key!;
    userId = CacheController.instance.getWebsitesArray()![websiteIndex].userID!;
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
  }) async {
    init();
    debugPrint('baseUrl $baseUrl');
    debugPrint('baseUrl $url');
    dio.options.headers["key"] = key;
    dio.options.headers["userId"] = userId;
    dio.options.headers["deviceId"] = CacheController.instance.getDeviceId();
    debugPrint("query:::: $query");
    debugPrint("header:::: ${dio.options.headers}");
    return await dio.get(
      url,
    );
  }

  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
  }) async {
    init();

    debugPrint("postData $url");
    debugPrint("data :: $data");
    dio.options.headers["key"] = key;
    dio.options.headers["userId"] = userId;
    //dio.options.headers["deviceId"] = CacheController.instance.getDeviceId();
    dio.options.headers["DEVICEID"] = CacheController.instance.getDeviceId();

    return await dio.post(
      url,
      data: data,
      queryParameters: query,
    );
  }
}
