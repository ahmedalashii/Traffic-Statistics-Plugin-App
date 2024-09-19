class MapDataModel {
  MapDataModel({
      bool? success, 
      Data? data,}){
    _success = success;
    _data = data;
    _proLink = proLink;
}

  MapDataModel.fromJson(dynamic json) {
    _success = json['success'];
    _data = json['data'] != null && json['data'].toString() != '[]' ? Data.fromJson(json['data']) : Data(title: '',map:[]);
    _proLink = json['proLink'] ?? '';

  }
  bool? _success;
  Data? _data;
  String? _proLink;

  bool? get success => _success;
  Data? get data => _data;
  String? get proLink => _proLink;

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
      List<MapData>? map,}){
    _title = title;
    _map = map;
}

  Data.fromJson(dynamic json) {
    _title = json['title'];
    if (json['map'] != null) {
      _map = [];
      json['map'].forEach((v) {
        _map?.add(MapData.fromJson(v));
      });
    }
  }
  String? _title;
  List<MapData>? _map;

  String? get title => _title;
  List<MapData>? get map => _map;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    if (_map != null) {
      map['map'] = _map?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class MapData {
  MapData({
      String? flags, 
      String? ctrName, 
      String? visitors, 
      String? latitude, 
      String? longitude,}){
    _flags = flags;
    _ctrName = ctrName;
    _visitors = visitors;
    _latitude = latitude;
    _longitude = longitude;
}

  MapData.fromJson(dynamic json) {
    _flags = json['flags'];
    _ctrName = json['ctr_name'];
    _visitors = json['visitors'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
  }
  String? _flags;
  String? _ctrName;
  String? _visitors;
  String? _latitude;
  String? _longitude;

  String? get flags => _flags;
  String? get ctrName => _ctrName;
  String? get visitors => _visitors;
  String? get latitude => _latitude;
  String? get longitude => _longitude;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['flags'] = _flags;
    map['ctr_name'] = _ctrName;
    map['visitors'] = _visitors;
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    return map;
  }

}