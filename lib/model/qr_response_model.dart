import 'dart:convert';

class QrResponseModel {
  QrResponseModel({
    String? key,
    String? url,
    String? apiUrl,
    String? title,
    String? siteIconUrl,
    int? userID,
  }) {
    _key = key;
    _url = url;
    _apiUrl = apiUrl;
    _title = title;
    _siteIconUrl = siteIconUrl;
    _userID = userID;
  }

  QrResponseModel.fromJson(dynamic json) {
    _key = json['key'];
    _url = json['url'];
    _apiUrl = json['apiUrl'];
    _title = json['title'];
    _siteIconUrl = json['site_icon_url'].toString();
    _userID = json['userID'];
  }

  String? _key;
  String? _url;
  String? _apiUrl;
  String? _title;
  String? _siteIconUrl;
  int? _userID;

  String? get key => _key;

  String? get url => _url;

  String? get apiUrl => _apiUrl;

  String? get title => _title;

  String? get siteIconUrl => _siteIconUrl;

  int? get userID => _userID;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['key'] = _key;
    map['url'] = _url;
    map['apiUrl'] = _apiUrl;
    map['title'] = _title;
    map['site_icon_url'] = _siteIconUrl;
    map['userID'] = _userID;
    return map;
  }

  static String encode(List<QrResponseModel> qrResponses) => json.encode(
        qrResponses
            .map<Map<String, dynamic>>((qrResponse) => qrResponse.toJson())
            .toList(),
      );

  static List<QrResponseModel> decode(String qrResponses) =>
      (json.decode(qrResponses) as List<dynamic>)
          .map<QrResponseModel>((item) => QrResponseModel.fromJson(item))
          .toList();
}
