import 'dart:convert';

class TaksModel {
  final int id;
  final String title;
  final String description;
  final String datetime;
  final bool select;
  TaksModel({
    required this.id,
    required this.title,
    required this.description,
    required this.datetime,
    required this.select,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'datetime': datetime,
      'select': select,
    };
  }

  factory TaksModel.fromMap(Map<String, dynamic> map) {
    return TaksModel(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      datetime: map['datetime'] ?? '',
      select: map['select'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory TaksModel.fromJson(String source) =>
      TaksModel.fromMap(json.decode(source));
}
