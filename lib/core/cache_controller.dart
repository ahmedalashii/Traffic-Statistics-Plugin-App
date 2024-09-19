

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:trafic_static_app/model/qr_response_model.dart';

class CacheController{

  CacheController._(){
    init();
  }

  static final CacheController _instance = CacheController._();

  static CacheController get instance => _instance;

  late SharedPreferences _sharedPreferences;

  Future init() async{
    _sharedPreferences = await SharedPreferences.getInstance();

  }
  Future setToken(String token) async{
    await  _sharedPreferences.setString('token',token);
  }

  String getToken(){
    return  _sharedPreferences.getString('token') ?? '';
  }


  Future setWebsite(String encodedData) async{
    await  _sharedPreferences.setString('websites',encodedData);
  }


  Future setWebsitesArray(String encodedData) async{
    await  _sharedPreferences.setString('websites_array',encodedData);
  }

  List<QrResponseModel>? getWebsitesArray() {
    try {
      String?  websitesArray = _sharedPreferences.getString('websites_array') ?? '';
      List<QrResponseModel> qrResponseModel = QrResponseModel.decode(websitesArray);
      return qrResponseModel;
    } on Exception catch (_) {
      return [];
    }
  }



  Future setDeviceId(String deviceId) async{
    await  _sharedPreferences.setString('deviceId',deviceId);
  }


  String getDeviceId(){
    return  _sharedPreferences.getString('deviceId') ?? '';
  }


  Future saveIndex(int index) async{
    await  _sharedPreferences.setInt('index',index);
  }


  int getIndex(){
    return  _sharedPreferences.getInt('index') ?? -1;
  }


  QrResponseModel? getWebsite() {
    try {
      Map json = jsonDecode(_sharedPreferences.getString('websites') ?? '');
      QrResponseModel qrResponseModel = QrResponseModel.fromJson(json);
      return qrResponseModel;
    } on Exception catch (_) {
      return null;
    }
  }



}