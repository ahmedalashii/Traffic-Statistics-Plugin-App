class SearchEnginsModel {
  SearchEnginsModel({
      bool? success, 
      Data? data,}){
    _success = success;
    _data = data;
}

  SearchEnginsModel.fromJson(dynamic json) {
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
      List<Data2>? data,}){
    _title = title;
    _data = data;
}

  Data.fromJson(dynamic json) {
    _title = json['title'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data2.fromJson(v));
      });
    }
  }
  String? _title;
  List<Data2>? _data;

  String? get title => _title;
  List<Data2>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Data2 {
  Data2({
      String? title, 
      String? value,}){
    _title = title;
    _value = value;
}

  Data2.fromJson(dynamic json) {
    _title = json['title'];
    _value = json['value'];
  }
  String? _title;
  String? _value;

  String? get title => _title;
  String? get value => _value;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['value'] = _value;
    return map;
  }

}