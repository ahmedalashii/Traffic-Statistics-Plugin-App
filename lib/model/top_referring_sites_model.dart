class TopReferringSitesModel {
  TopReferringSitesModel({
      bool? success, 
      Data? data,}){
    _success = success;
    _data = data;
}

  TopReferringSitesModel.fromJson(dynamic json) {
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
      String? siteName, 
      String? link, 
      String? img, 
      String? totalHits, 
      String? imageTitle,}){
    _siteName = siteName;
    _link = link;
    _img = img;
    _totalHits = totalHits;
    _imageTitle = imageTitle;
}

  Data2.fromJson(dynamic json) {
    _siteName = json['site_name'];
    _link = json['link'];
    _img = json['img'];
    _totalHits = json['total_hits'];
    _imageTitle = json['image_title'];
  }
  String? _siteName;
  String? _link;
  String? _img;
  String? _totalHits;
  String? _imageTitle;

  String? get siteName => _siteName;
  String? get link => _link;
  String? get img => _img;
  String? get totalHits => _totalHits;
  String? get imageTitle => _imageTitle;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['site_name'] = _siteName;
    map['link'] = _link;
    map['img'] = _img;
    map['total_hits'] = _totalHits;
    map['image_title'] = _imageTitle;
    return map;
  }

}

