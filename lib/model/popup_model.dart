class PopupModel {
  PopupModel({
      this.success, 
      this.massage, 
      this.data,});

  PopupModel.fromJson(dynamic json) {
    success = json['success'];
    massage = json['massage'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? success;
  String? massage;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['massage'] = massage;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

class Data {
  Data({
      this.hitIpAddress, 
      this.ctrNameAhcCity, 
      this.hitDate, 
      this.data,});

  Data.fromJson(dynamic json) {
    hitIpAddress = json['hit_ip_address'];
    ctrNameAhcCity = json['ctr_name_ahc_city'];
    hitDate = json['hit_date'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data2.fromJson(v));
      });
    }
  }
  String? hitIpAddress;
  String? ctrNameAhcCity;
  String? hitDate;
  List<Data2>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['hit_ip_address'] = hitIpAddress;
    map['ctr_name_ahc_city'] = ctrNameAhcCity;
    map['hit_date'] = hitDate;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Data2 {
  Data2({
      this.requestUri, 
      this.hitPageTitle, 
      this.hitDate, 
      this.hitTime,});

  Data2.fromJson(dynamic json) {
    requestUri = json['request_uri'];
    hitPageTitle = json['hit_page_title'];
    hitDate = json['hit_date'];
    hitTime = json['hit_time'];
  }
  String? requestUri;
  String? hitPageTitle;
  String? hitDate;
  String? hitTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['request_uri'] = requestUri;
    map['hit_page_title'] = hitPageTitle;
    map['hit_date'] = hitDate;
    map['hit_time'] = hitTime;
    return map;
  }

}