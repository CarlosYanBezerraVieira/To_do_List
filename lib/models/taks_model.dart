import 'dart:convert';

class TaskModel {
  final int? id;
  final String? title;
  final String? datatime;
  final String? time;
  final String? description;
  final int value;
  TaskModel({
    this.id,
    this.title,
    this.datatime,
    this.time,
    this.description,
    required this.value,
  });

  @override
  String toString() {
    return """ 
    TaskModel 
    title: $title,
    datatime: $datatime,
    time: $time,
    description: $description,
    value: $value""";
  }

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
      id: map['id']?.toInt(),
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
}
