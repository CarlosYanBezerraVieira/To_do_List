import 'dart:convert';

class TaskModel {
  final int id;
  final String? title;
  final String? data;
  final String? time;
  final String? alarm;
  final bool select;
  TaskModel({
    required this.id,
    this.title,
    this.data,
    this.time,
    this.alarm,
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

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      data: map['data'] ?? '',
      time: map['time'] ?? '',
      alarm: map['alarm'] ?? '',
      select: map['select'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory TaskModel.fromJson(String source) =>
      TaskModel.fromMap(json.decode(source));

  @override
  String toString() {
    return """ 
    TaskModel 
    id: $id,
    title: $title,
    data: $data,
    time: $time,
    alarm: $alarm,
    select: $select""";
  }
}
