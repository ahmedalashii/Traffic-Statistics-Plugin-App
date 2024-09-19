class TrafficByTitleModel {
  TrafficByTitleModel({
      bool? success, 
      String? title, 
      Data? data,}){
    _success = success;
    _title = title;
    _data = data;
}

  TrafficByTitleModel.fromJson(dynamic json) {
    _success = json['success'];
    _title = json['title'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _success;
  String? _title;
  Data? _data;

  bool? get success => _success;
  String? get title => _title;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['title'] = _title;
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
      List<Data2>? data,}){
    _draw = draw;
    _recordsTotal = recordsTotal;
    _recordsFiltered = recordsFiltered;
    _data = data;
}

  Data.fromJson(dynamic json) {
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
  int? _draw;
  int? _recordsTotal;
  int? _recordsFiltered;
  List<Data2>? _data;

  int? get draw => _draw;
  int? get recordsTotal => _recordsTotal;
  int? get recordsFiltered => _recordsFiltered;
  List<Data2>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
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
      int? rank, 
      String? tilPageTitle, 
      String? tilHits, 
      String? percent,}){
    _rank = rank;
    _tilPageTitle = tilPageTitle;
    _tilHits = tilHits;
    _percent = percent;
}

  Data2.fromJson(dynamic json) {
    _rank = json['rank'];
    _tilPageTitle = json['til_page_title'];
    _tilHits = json['til_hits'];
    _percent = json['percent'];
  }
  int? _rank;
  String? _tilPageTitle;
  String? _tilHits;
  String? _percent;

  int? get rank => _rank;
  String? get tilPageTitle => _tilPageTitle;
  String? get tilHits => _tilHits;
  String? get percent => _percent;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['rank'] = _rank;
    map['til_page_title'] = _tilPageTitle;
    map['til_hits'] = _tilHits;
    map['percent'] = _percent;
    return map;
  }

}