class SummaryTrafficModel {
  SummaryTrafficModel(
      );
  late final bool success;
  late final Data data;

  SummaryTrafficModel.fromJson(Map<String, dynamic> json){
    success = json['success'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['data'] = data.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.title,
    required this.data2,
  });
  late final String title;
  late final Data2 data2;

  Data.fromJson(Map<String, dynamic> json){
    title = json['title'];
    data2 = Data2.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['title'] = title;
    _data['data'] = data2.toJson();
    return _data;
  }
}

class Data2 {
  Data2({
    required this.titleTable,
    required this.today,
    required this.yesterday,
    required this.thisWeek,
    required this.thisMonth,
    required this.thisYesr,
    required this.total,
  });
  late final TitleTable titleTable;
  late final Today today;
  late final Yesterday yesterday;
  late final ThisWeek thisWeek;
  late final ThisMonth thisMonth;
  late final ThisYesr thisYesr;
  late final Total total;

  Data2.fromJson(Map<String, dynamic> json){
    titleTable = TitleTable.fromJson(json['title_table']);
    today = Today.fromJson(json['today']);
    yesterday = Yesterday.fromJson(json['yesterday']);
    thisWeek = ThisWeek.fromJson(json['this_week']);
    thisMonth = ThisMonth.fromJson(json['this_month']);
    thisYesr = ThisYesr.fromJson(json['this_yesr']);
    total = Total.fromJson(json['total']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['title_table'] = titleTable.toJson();
    _data['today'] = today.toJson();
    _data['yesterday'] = yesterday.toJson();
    _data['this_week'] = thisWeek.toJson();
    _data['this_month'] = thisMonth.toJson();
    _data['this_yesr'] = thisYesr.toJson();
    _data['total'] = total.toJson();
    return _data;
  }
}

class TitleTable {
  TitleTable({
    required this.title,
    required this.visitors,
    required this.visits,
  });
  late final String title;
  late final String visitors;
  late final String visits;

  TitleTable.fromJson(Map<String, dynamic> json){
    title = json['title'];
    visitors = json['visitors'];
    visits = json['visits'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['title'] = title;
    _data['visitors'] = visitors;
    _data['visits'] = visits;
    return _data;
  }
}

class Today {
  Today({
    required this.title,
    required this.visitors,
    required this.visits,
  });
  late final String title;
  late final String visitors;
  late final String visits;

  Today.fromJson(Map<String, dynamic> json){
    title = json['title'];
    visitors = json['visitors'].toString();
    visits = json['visits'].toString();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['title'] = title;
    _data['visitors'] = visitors;
    _data['visits'] = visits;
    return _data;
  }
}

class Yesterday {
  Yesterday({
    required this.title,
    required this.visitors,
    required this.visits,
  });
  late final String title;
  late final String visitors;
  late final String visits;

  Yesterday.fromJson(Map<String, dynamic> json){
    title = json['title'];
    visitors = json['visitors'].toString();
    visits = json['visits'].toString();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['title'] = title;
    _data['visitors'] = visitors;
    _data['visits'] = visits;
    return _data;
  }
}

class ThisWeek {
  ThisWeek({
    required this.title,
    required this.visitors,
    required this.visits,
  });
  late final String title;
  late final String visitors;
  late final String visits;

  ThisWeek.fromJson(Map<String, dynamic> json){
    title = json['title'];
    visitors = json['visitors'].toString();
    visits = json['visits'].toString();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['title'] = title;
    _data['visitors'] = visitors;
    _data['visits'] = visits;
    return _data;
  }
}

class ThisMonth {
  ThisMonth({
    required this.title,
    required this.visitors,
    required this.visits,
  });
  late final String title;
  late final String visitors;
  late final String visits;

  ThisMonth.fromJson(Map<String, dynamic> json){
    title = json['title'];
    visitors = json['visitors'].toString();
    visits = json['visits'].toString();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['title'] = title;
    _data['visitors'] = visitors;
    _data['visits'] = visits;
    return _data;
  }
}

class ThisYesr {
  ThisYesr({
    required this.title,
    required this.visitors,
    required this.visits,
  });
  late final String title;
  late final String visitors;
  late final String visits;

  ThisYesr.fromJson(Map<String, dynamic> json){
    title = json['title'];
    visitors = json['visitors'].toString();
    visits = json['visits'].toString();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['title'] = title;
    _data['visitors'] = visitors;
    _data['visits'] = visits;
    return _data;
  }
}

class Total {
  Total({
    required this.title,
    required this.visitors,
    required this.visits,
  });
  late final String title;
  late final String visitors;
  late final String visits;

  Total.fromJson(Map<String, dynamic> json){
    title = json['title'];
    visitors = json['visitors'].toString();
    visits = json['visits'].toString();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['title'] = title;
    _data['visitors'] = visitors;
    _data['visits'] = visits;
    return _data;
  }
}