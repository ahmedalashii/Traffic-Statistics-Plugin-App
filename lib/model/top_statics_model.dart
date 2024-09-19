class TopStaticsModel {
  TopStaticsModel({
      bool? success, 
      Data? data,}){
    _success = success;
    _data = data;
}

  TopStaticsModel.fromJson(dynamic json) {
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
      List<Data2>? data,}){
    _data = data;
}

  Data.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data2.fromJson(v));
      });
    }
  }
  List<Data2>? _data;

  List<Data2>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Data2 {
  Data2({
      String? title, 
      String? image, 
      String? icon, 
      String? total,}){
    _title = title;
    _image = image;
    _icon = icon;
    _total = total;
}

  Data2.fromJson(dynamic json) {
    _title = json['title'];
    _image = json['image'];
    _icon = json['icon'];
    _total = json['total'].toString();

  }
  String? _title;
  String? _image;
  String? _icon;
  String? _total;

  String? get title => _title;
  String? get image => _image;
  String? get icon => _icon;
  String? get total => _total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['image'] = _image;
    map['icon'] = _icon;
    map['total'] = _total;
    return map;
  }

}