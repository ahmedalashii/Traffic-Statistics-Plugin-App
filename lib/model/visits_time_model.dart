class VisitsTimeModel {
  VisitsTimeModel({
      bool? success, 
      Data? data,}){
    _success = success;
    _data = data;
}

  VisitsTimeModel.fromJson(dynamic json) {
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
      int? recordsTotal, 
      int? recordsFiltered, 
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
  int? _recordsTotal;
  int? _recordsFiltered;
  List<Data2>? _data2;

  int? get draw => _draw;
  int? get recordsTotal => _recordsTotal;
  int? get recordsFiltered => _recordsFiltered;
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
      String? vtmTimeFrom, 
      String? vtmTimeTo, 
      String? time, 
      int? vtmVisitors, 
      int? vtmVisits,
    double? percent,}){
    _vtmTimeFrom = vtmTimeFrom;
    _vtmTimeTo = vtmTimeTo;
    _time = time;
    _vtmVisitors = vtmVisitors;
    _vtmVisits = vtmVisits;
    _percent = percent;
}

  Data2.fromJson(dynamic json) {
    _vtmTimeFrom = json['vtm_time_from'];
    _vtmTimeTo = json['vtm_time_to'];
    _time = json['time'];
    _vtmVisitors = json['vtm_visitors'];
    _vtmVisits = json['vtm_visits'];
    try{
      _percent = double.parse(json['percent']);
    }
    catch(e){
      _percent = json['percent'].toDouble();
    }
  }
  String? _vtmTimeFrom;
  String? _vtmTimeTo;
  String? _time;
  int? _vtmVisitors;
  int? _vtmVisits;
  double? _percent;

  String? get vtmTimeFrom => _vtmTimeFrom;
  String? get vtmTimeTo => _vtmTimeTo;
  String? get time => _time;
  int? get vtmVisitors => _vtmVisitors;
  int? get vtmVisits => _vtmVisits;
  double? get percent => _percent;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['vtm_time_from'] = _vtmTimeFrom;
    map['vtm_time_to'] = _vtmTimeTo;
    map['time'] = _time;
    map['vtm_visitors'] = _vtmVisitors;
    map['vtm_visits'] = _vtmVisits;
    map['percent'] = _percent;
    return map;
  }

}