class TrafficByContryModel {
  TrafficByContryModel({
      bool? success, 
      Data? data,}){
    _success = success;
    _data = data;
    _proLink = proLink;

  }

  TrafficByContryModel.fromJson(dynamic json) {
    _success = json['success'];
    _data = json['data'] != null && json['data'].toString() != '[]' ? Data.fromJson(json['data']) : Data(title: '',recordsTotal: '',recordsFiltered: '',data: [],draw:0 );
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
      int? draw, 
      String? recordsTotal, 
      String? recordsFiltered, 
      List<Data2>? data,}){
    _title = title;
    _draw = draw;
    _recordsTotal = recordsTotal;
    _recordsFiltered = recordsFiltered;
    _data = data;
}

  Data.fromJson(dynamic json) {
    _title = json['title'];
    _draw = json['draw'];
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
  int? _draw;
  String? _recordsTotal;
  String? _recordsFiltered;
  List<Data2>? _data;

  String? get title => _title;
  int? get draw => _draw;
  String? get recordsTotal => _recordsTotal;
  String? get recordsFiltered => _recordsFiltered;
  List<Data2>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['draw'] = _draw;
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
      int? no, 
      String? country, 
      String? ctrName, 
      String? ctrInternetCode, 
      String? total,}){
    _no = no;
    _country = country;
    _ctrName = ctrName;
    _ctrInternetCode = ctrInternetCode;
    _total = total;
}

  Data2.fromJson(dynamic json) {
    _no = json['no'];
    _country = json['country'];
    _ctrName = json['ctr_name'];
    _ctrInternetCode = json['ctr_internet_code'];
    _total = json['total'];
  }
  int? _no;
  String? _country;
  String? _ctrName;
  String? _ctrInternetCode;
  String? _total;

  int? get no => _no;
  String? get country => _country;
  String? get ctrName => _ctrName;
  String? get ctrInternetCode => _ctrInternetCode;
  String? get total => _total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['no'] = _no;
    map['country'] = _country;
    map['ctr_name'] = _ctrName;
    map['ctr_internet_code'] = _ctrInternetCode;
    map['total'] = _total;
    return map;
  }

}