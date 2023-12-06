// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';
part 'account.g.dart';

// g.dart file generator : flutter pub run build_runner build

/*
  "id": "string",
    "name": "string",
    "createdAt": "string",
    "stared": true,
    "fields": [
      {
        "id": "string",
        "name": "string",
        "value": "string",
        "emoji": "string",
        "hidePreview": true,
        "description": "string"
      }
    ]
*/

@JsonSerializable()
class Field {
  String id;
  String name;
  String value;
  String emoji;
  bool hidePreview;
  String description;

  Field(
      {required this.id,
      required this.name,
      required this.value,
      required this.emoji,
      required this.hidePreview,
      required this.description});

  factory Field.fromJson(Map<String, dynamic> json) => _$FieldFromJson(json);
  Map<String, dynamic> toJson() => _$FieldToJson(this);
}

@JsonSerializable()
class Account {
  String id;
  String name;
  DateTime createdAt;
  bool stared;
  List<Field> fields;

  Account(
      {required this.id,
      required this.name,
      required this.createdAt,
      required this.stared,
      required this.fields});

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);
  Map<String, dynamic> toJson() => _$AccountToJson(this);
}
