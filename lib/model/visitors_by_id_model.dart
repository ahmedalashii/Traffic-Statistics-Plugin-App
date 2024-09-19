class VisitorsByIdModel {
  VisitorsByIdModel({
      bool? success, 
      Data? data,}){
    _success = success;
    _data = data;
}

  VisitorsByIdModel.fromJson(dynamic json) {
    _success = json['success'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _success;
  Data? _data;

  bool? get success => _success;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

class Data {
  Data({
      String? title, 
      String? recordsTotal, 
      String? recordsFiltered, 
      List<Data2>? data,}){
    _title = title;
    _recordsTotal = recordsTotal;
    _recordsFiltered = recordsFiltered;
    _data = data;
}

  Data.fromJson(dynamic json) {
    _title = json['title'];
    _recordsTotal = json['recordsTotal'].toString();
    _recordsFiltered = json['recordsFiltered'].toString();
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data2.fromJson(v));
      });
    }
  }
  String? _title;
  String? _recordsTotal;
  String? _recordsFiltered;
  List<Data2>? _data;

  String? get title => _title;
  String? get recordsTotal => _recordsTotal;
  String? get recordsFiltered => _recordsFiltered;
  List<Data2>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['recordsTotal'] = _recordsTotal;
    map['recordsFiltered'] = _recordsFiltered;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Data2 {
  Data2({
      String? hitIpAddress, 
      String? cityImage, 
      String? ctrName, 
      String? ahcCity, 
      String? ahcRegion, 
      String? time, 
      String? modallDayHits, 
      dynamic modallHitDate, 
      dynamic modallHitIpAddress, 
      String? modallCtrNameAhcCity,}){
    _hitIpAddress = hitIpAddress;
    _cityImage = cityImage;
    _ctrName = ctrName;
    _ahcCity = ahcCity;
    _ahcRegion = ahcRegion;
    _time = time;
    _modallDayHits = modallDayHits;
    _modallHitDate = modallHitDate;
    _modallHitIpAddress = modallHitIpAddress;
    _modallCtrNameAhcCity = modallCtrNameAhcCity;
}

  Data2.fromJson(dynamic json) {
    _hitIpAddress = json['hit_ip_address'].toString();
    _cityImage = json['city_image'].toString();
    _ctrName = json['ctr_name'].toString();
    _ahcCity = json['ahc_city'].toString();
    _ahcRegion = json['ahc_region'].toString();
    _time = json['time'].toString();
    _modallDayHits = json['modall_day_hits'];
    _modallHitDate = json['modall_hit_date'];
    _modallHitIpAddress = json['modall_hit_ip_address'];
    _modallCtrNameAhcCity = json['modall_ctr_name_ahc_city'];
  }
  String? _hitIpAddress;
  String? _cityImage;
  String? _ctrName;
  String? _ahcCity;
  String? _ahcRegion;
  String? _time;
  String? _modallDayHits;
  dynamic _modallHitDate;
  dynamic _modallHitIpAddress;
  String? _modallCtrNameAhcCity;

  String? get hitIpAddress => _hitIpAddress;
  String? get cityImage => _cityImage;
  String? get ctrName => _ctrName;
  String? get ahcCity => _ahcCity;
  String? get ahcRegion => _ahcRegion;
  String? get time => _time;
  String? get modallDayHits => _modallDayHits;
  dynamic get modallHitDate => _modallHitDate;
  dynamic get modallHitIpAddress => _modallHitIpAddress;
  String? get modallCtrNameAhcCity => _modallCtrNameAhcCity;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['hit_ip_address'] = _hitIpAddress;
    map['city_image'] = _cityImage;
    map['ctr_name'] = _ctrName;
    map['ahc_city'] = _ahcCity;
    map['ahc_region'] = _ahcRegion;
    map['time'] = _time;
    map['modall_day_hits'] = _modallDayHits;
    map['modall_hit_date'] = _modallHitDate;
    map['modall_hit_ip_address'] = _modallHitIpAddress;
    map['modall_ctr_name_ahc_city'] = _modallCtrNameAhcCity;
    return map;
  }

}