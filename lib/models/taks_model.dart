import 'dart:convert';

class TaksModel {
  final int id;
  final String title;
  final String data;
  final String time;
  final String alarm;
  final bool select;
  TaksModel({
    required this.id,
    required this.title,
    required this.data,
    required this.time,
    required this.alarm,
    required this.select,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'data': data,
      'time': time,
      'alarm': alarm,
      'select': select,
    };
  }

  factory TaksModel.fromMap(Map<String, dynamic> map) {
    return TaksModel(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      data: map['data'] ?? '',
      time: map['time'] ?? '',
      alarm: map['alarm'] ?? '',
      select: map['select'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory TaksModel.fromJson(String source) =>
      TaksModel.fromMap(json.decode(source));

  @override
  String toString() {
    return """ 
    TaksModel 
    id: $id,
    title: $title,
    data: $data,
    time: $time,
    alarm: $alarm,
    select: $select""";
  }
}
