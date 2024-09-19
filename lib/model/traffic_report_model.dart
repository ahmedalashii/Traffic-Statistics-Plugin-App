class TrafficReportModel {
  TrafficReportModel({
      bool? success, 
      Data? data,}){
    _success = success;
    _data = data;
}

  TrafficReportModel.fromJson(dynamic json) {
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
      List<dynamic>? visits,
      List<dynamic>? visitors,}){
    _visits = visits;
    _visitors = visitors;
}

  Data.fromJson(dynamic json) {

    _visits = json['visits'] ?? [];
    _visitors = json['visitors'] ?? [];
    //
    // _visits =  visits!.map((e) {
    //   return e.map((e) => e.toString()).toList();
    // }).toList();
    //
    // _visitors =  visitors!.map((e) {
    //   return e.map((e) => e.toString()).toList();
    // }).toList();

  }
  List<dynamic>? _visits;
  List<dynamic>? _visitors;

  List<dynamic>? get visits => _visits;
  List<dynamic>? get visitors => _visitors;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['visits'] = _visits;
    map['visitors'] = _visitors;
    return map;
  }

}