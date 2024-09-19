class BrowsersDataModel {
  BrowsersDataModel({
      bool? success, 
      Data? data,}){
    _success = success;
    _data = data;
}

  BrowsersDataModel.fromJson(dynamic json) {
    _success = json['success'];
    _data = json['data'] != null && json['data'].toString() != '[]' ? Data.fromJson(json['data']) : Data(title: '',data2:Data2(data3: [],success: false));
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
      Data2? data2,}){
    _title = title;
    _data2 = data2;
}

  Data.fromJson(dynamic json) {
    _title = json['title'];
    _data2 = json['data'] != null ? Data2.fromJson(json['data']) : null;
  }
  String? _title;
  Data2? _data2;

  String? get title => _title;
  Data2? get data2 => _data2;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    if (_data2 != null) {
      map['data'] = _data2?.toJson();
    }
    return map;
  }

}

class Data2 {
  Data2({
      bool? success, 
      List<Data3>? data3,}){
    _success = success;
    _data3 = data3;
}

  Data2.fromJson(dynamic json) {
    _success = json['success'];
    if (json['data'] != null) {
      _data3 = [];
      json['data'].forEach((v) {
        _data3?.add(Data3.fromJson(v));
      });
    }
  }
  bool? _success;
  List<Data3>? _data3;

  bool? get success => _success;
  List<Data3>? get data3 => _data3;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    if (_data3 != null) {
      map['data'] = _data3?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Data3 {
  Data3({
      String? bsrId, 
      String? bsrName, 
      String? hits,}){
    _bsrId = bsrId;
    _bsrName = bsrName;
    _hits = hits;
}

  Data3.fromJson(dynamic json) {
    _bsrId = json['bsr_id'];
    _bsrName = json['bsr_name'];
    _hits = json['hits'];
  }
  String? _bsrId;
  String? _bsrName;
  String? _hits;

  String? get bsrId => _bsrId;
  String? get bsrName => _bsrName;
  String? get hits => _hits;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['bsr_id'] = _bsrId;
    map['bsr_name'] = _bsrName;
    map['hits'] = _hits;
    return map;
  }

}