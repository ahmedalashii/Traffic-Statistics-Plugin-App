class LastSearchWordsModel {
  LastSearchWordsModel({
      bool? success, 
      Data? data,}){
    _success = success;
    _data = data;
}

  LastSearchWordsModel.fromJson(dynamic json) {
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
      int? draw, 
      String? recordsTotal, 
      String? recordsFiltered, 
      List<Data2>? data2,}){
    _draw = draw;
    _recordsTotal = recordsTotal;
    _recordsFiltered = recordsFiltered;
    _data2 = data2;
}

  Data.fromJson(dynamic json) {
    _draw = json['draw'];
    _recordsTotal = json['recordsTotal'];
    _recordsFiltered = json['recordsFiltered'];
    if (json['data'] != null) {
      _data2 = [];
      json['data'].forEach((v) {
        _data2?.add(Data2.fromJson(v));
      });
    }
  }
  int? _draw;
  String? _recordsTotal;
  String? _recordsFiltered;
  List<Data2>? _data2;

  int? get draw => _draw;
  String? get recordsTotal => _recordsTotal;
  String? get recordsFiltered => _recordsFiltered;
  List<Data2>? get data2 => _data2;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['draw'] = _draw;
    map['recordsTotal'] = _recordsTotal;
    map['recordsFiltered'] = _recordsFiltered;
    if (_data2 != null) {
      map['data'] = _data2?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Data2 {
  Data2({
      String? hitReferer, 
      String? hitSearchWords, 
      String? hitDate, 
      String? hitTime, 
      String? hitIpAddress, 
      String? ctrName, 
      String? ctrInternetCode, 
      String? bsrName, 
      String? bsrIcon, 
      String? srhName, 
      String? srhIcon, 
      String? eurl, 
      String? burl, 
      String? dt,}){
    _hitReferer = hitReferer;
    _hitSearchWords = hitSearchWords;
    _hitDate = hitDate;
    _hitTime = hitTime;
    _hitIpAddress = hitIpAddress;
    _ctrName = ctrName;
    _ctrInternetCode = ctrInternetCode;
    _bsrName = bsrName;
    _bsrIcon = bsrIcon;
    _srhName = srhName;
    _srhIcon = srhIcon;
    _eurl = eurl;
    _burl = burl;
    _dt = dt;
}

  Data2.fromJson(dynamic json) {
    _hitReferer = json['hit_referer'];
    _hitSearchWords = json['hit_search_words'];
    _hitDate = json['hit_date'];
    _hitTime = json['hit_time'];
    _hitIpAddress = json['hit_ip_address'];
    _ctrName = json['ctr_name'];
    _ctrInternetCode = json['ctr_internet_code'];
    _bsrName = json['bsr_name'];
    _bsrIcon = json['bsr_icon'];
    _srhName = json['srh_name'];
    _srhIcon = json['srh_icon'];
    _eurl = json['eurl'];
    _burl = json['burl'];
    _dt = json['dt'];
  }
  String? _hitReferer;
  String? _hitSearchWords;
  String? _hitDate;
  String? _hitTime;
  String? _hitIpAddress;
  String? _ctrName;
  String? _ctrInternetCode;
  String? _bsrName;
  String? _bsrIcon;
  String? _srhName;
  String? _srhIcon;
  String? _eurl;
  String? _burl;
  String? _dt;

  String? get hitReferer => _hitReferer;
  String? get hitSearchWords => _hitSearchWords;
  String? get hitDate => _hitDate;
  String? get hitTime => _hitTime;
  String? get hitIpAddress => _hitIpAddress;
  String? get ctrName => _ctrName;
  String? get ctrInternetCode => _ctrInternetCode;
  String? get bsrName => _bsrName;
  String? get bsrIcon => _bsrIcon;
  String? get srhName => _srhName;
  String? get srhIcon => _srhIcon;
  String? get eurl => _eurl;
  String? get burl => _burl;
  String? get dt => _dt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['hit_referer'] = _hitReferer;
    map['hit_search_words'] = _hitSearchWords;
    map['hit_date'] = _hitDate;
    map['hit_time'] = _hitTime;
    map['hit_ip_address'] = _hitIpAddress;
    map['ctr_name'] = _ctrName;
    map['ctr_internet_code'] = _ctrInternetCode;
    map['bsr_name'] = _bsrName;
    map['bsr_icon'] = _bsrIcon;
    map['srh_name'] = _srhName;
    map['srh_icon'] = _srhIcon;
    map['eurl'] = _eurl;
    map['burl'] = _burl;
    map['dt'] = _dt;
    return map;
  }

}