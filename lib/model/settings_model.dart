class SettingsModel {
  SettingsModel({
      this.success, 
      this.data,});

  SettingsModel.fromJson(dynamic json) {
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? success;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

class Data {
  Data({
      this.data2,});

  Data.fromJson(dynamic json) {
    data2 = json['data'] != null ? Data2.fromJson(json['data']) : null;
  }
  Data2? data2;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data2 != null) {
      map['data'] = data2?.toJson();
    }
    return map;
  }

}

class Data2 {
  Data2({
      this.pluginAccessibility, 
      this.mapWillDisplay, 
      this.selectTimezone, 
      this.iPsToExclude,});

  Data2.fromJson(dynamic json) {
    pluginAccessibility = json['Plugin_Accessibility'] != null ? Plugin_Accessibility.fromJson(json['Plugin_Accessibility']) : null;
    mapWillDisplay = json['Map_will_display'] != null ? Map_will_display.fromJson(json['Map_will_display']) : null;
    selectTimezone = json['Select_Timezone'] != null ? Select_Timezone.fromJson(json['Select_Timezone']) : null;
    iPsToExclude = json['IPs_to_exclude'] != null ? IPs_to_exclude.fromJson(json['IPs_to_exclude']) : null;
  }
  Plugin_Accessibility? pluginAccessibility;
  Map_will_display? mapWillDisplay;
  Select_Timezone? selectTimezone;
  IPs_to_exclude? iPsToExclude;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (pluginAccessibility != null) {
      map['Plugin_Accessibility'] = pluginAccessibility?.toJson();
    }
    if (mapWillDisplay != null) {
      map['Map_will_display'] = mapWillDisplay?.toJson();
    }
    if (selectTimezone != null) {
      map['Select_Timezone'] = selectTimezone?.toJson();
    }
    if (iPsToExclude != null) {
      map['IPs_to_exclude'] = iPsToExclude?.toJson();
    }
    return map;
  }

}

class IPs_to_exclude {
  IPs_to_exclude({
      this.title, 
      this.disc, 
      this.value,});

  IPs_to_exclude.fromJson(dynamic json) {
    value = json['value'] ?? '';
  }
  String? title;
  String? disc;
  dynamic value;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['disc'] = disc;
    map['value'] = value;
    return map;
  }

}

class Select_Timezone {
  Select_Timezone({
      this.title, 
      this.disc, 
      this.value, 
      this.data,});

  Select_Timezone.fromJson(dynamic json) {
    value = json['value'] ?? '';
    data = json['data'] != null ? json['data'].cast<String>() : [];
  }
  String? title;
  String? disc;
  String? value;
  List<String>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['disc'] = disc;
    map['value'] = value;
    map['data'] = data;
    return map;
  }

}

class Map_will_display {
  Map_will_display({
      this.title, 
      this.disc, 
      this.value, 
      this.data,});

  Map_will_display.fromJson(dynamic json) {
    value = json['value'] ?? '';
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Map_will_displayData.fromJson(v));
      });
    }
  }
  String? title;
  String? disc;
  String? value;
  List<Map_will_displayData>? data = [];

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['disc'] = disc;
    map['value'] = value;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Map_will_displayData {
  Map_will_displayData({
      this.key, 
      this.value,});

  Map_will_displayData.fromJson(dynamic json) {
    key = json['key'];
    value = json['value'];
  }
  String? key;
  String? value;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['key'] = key;
    map['value'] = value;
    return map;
  }

}

class Plugin_Accessibility {
  Plugin_Accessibility({
      this.title, 
      this.disc, 
      this.value, 
      this.data,});

  Plugin_Accessibility.fromJson(dynamic json) {

    value = json['value'] != null ? json['value'] : [''];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Plugin_AccessibilityData.fromJson(v));
      });
    }
  }
  String? title;
  String? disc;
  List<dynamic>? value;
  List<Plugin_AccessibilityData>? data = [];

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['disc'] = disc;
    map['value'] = value;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Plugin_AccessibilityData {
  Plugin_AccessibilityData({
      this.key, 
      this.value,});

  Plugin_AccessibilityData.fromJson(dynamic json) {
    key = json['key'];
    value = json['value'] ?? '';
  }
  String? key;
  String? value;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['key'] = key;
    map['value'] = value;
    return map;
  }

}