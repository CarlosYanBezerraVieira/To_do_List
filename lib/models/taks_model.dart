import 'dart:convert';

class TaskModel {
  final int id;
  final String? title;
  final int? datatime;
  final int? time;
  final String? description;
  final int value;
  TaskModel({
    required this.id,
    this.title,
    this.datatime,
    this.time,
    this.description,
    required this.value,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'datatime': datatime,
      'time': time,
      'description': description,
      'value': value,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      id: map['id']?.toInt() ?? 0,
      title: map['title'],
      datatime: map['datatime'],
      time: map['time'],
      description: map['description'],
      value: map['value']?.toInt() ?? 0,
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
    datatime: $datatime,
    time: $time,
    description: $description,
    value: $value""";
  }
}
