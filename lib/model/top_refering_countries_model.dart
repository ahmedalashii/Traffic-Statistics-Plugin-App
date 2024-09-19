class TopReferingCountriesModel {
  TopReferingCountriesModel({
      bool? success, 
      Data? data,}){
    _success = success;
    _data = data;
    _proLink = proLink;

  }

  TopReferingCountriesModel.fromJson(dynamic json) {
    _success = json['success'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
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
      Data2? data2,}){
    _title = title;
    _data2 = data2;
}

  Data.fromJson(dynamic json) {
    _title = json['title'];
    _data2 = json['data'] != null && json['data'].toString() != '[]' ? Data2.fromJson(json['data']) : Data2(success: false ,data3: []);

  //  _data2 = json['data'] != null ? Data2.fromJson(json['data']) : null;
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
      int? rank, 
      String? flag, 
      String? ctrName, 
      String? visitors, 
      String? visits,}){
    _rank = rank;
    _flag = flag;
    _ctrName = ctrName;
    _visitors = visitors;
    _visits = visits;
}

  Data3.fromJson(dynamic json) {
    _rank = json['rank'];
    _flag = json['flag'];
    _ctrName = json['ctr_name'];
    _visitors = json['visitors'];
    _visits = json['visits'];
  }
  int? _rank;
  String? _flag;
  String? _ctrName;
  String? _visitors;
  String? _visits;

  int? get rank => _rank;
  String? get flag => _flag;
  String? get ctrName => _ctrName;
  String? get visitors => _visitors;
  String? get visits => _visits;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['rank'] = _rank;
    map['flag'] = _flag;
    map['ctr_name'] = _ctrName;
    map['visitors'] = _visitors;
    map['visits'] = _visits;
    return map;
  }

}