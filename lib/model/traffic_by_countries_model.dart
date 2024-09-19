class TrafficByCountriesModel {
  TrafficByCountriesModel({
      bool? success, 
      Data? data,}){
    _success = success;
    _data = data;
    _proLink = proLink;

  }

  TrafficByCountriesModel.fromJson(dynamic json) {
    _success = json['success'];
    _data = json['data'] != null && json['data'].toString() != '[]' ? Data.fromJson(json['data']) : Data(title: '',data: [],recordsFiltered: '',recordsTotal: '');
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
    _recordsTotal = json['recordsTotal'];
    _recordsFiltered = json['recordsFiltered'];
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

  Data2.fromJson(dynamic json) {
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