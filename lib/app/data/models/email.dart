// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';
part 'email.g.dart';

// g.dart file generator : flutter pub run build_runner build

/*
{
    "id": "string",
    "createdAt": "string",
    "deletedAt": "string",
    "email": "string"
  } 
*/

@JsonSerializable()
class Email {
  String id;
  DateTime createdAt;
  DateTime? deletedAt;
  DateTime? lastSyncedAt;
  String email;

  Email(
      {required this.id,
      required this.createdAt,
      required this.deletedAt,
      required this.lastSyncedAt,
      required this.email});

  factory Email.fromJson(Map<String, dynamic> json) => _$EmailFromJson(json);
  Map<String, dynamic> toJson() => _$EmailToJson(this);
}

@JsonSerializable()
class EmailMessage {
  String id;
  DateTime createdAt;
  DateTime receivedAt;
  String from;
  String to;
  String text;
  String html;
  String subject;

  EmailMessage(
      {required this.id,
      required this.createdAt,
      required this.receivedAt,
      required this.from,
      required this.to,
      required this.text,
      required this.html,
      required this.subject});

  factory EmailMessage.fromJson(Map<String, dynamic> json) =>
      _$EmailMessageFromJson(json);
  Map<String, dynamic> toJson() => _$EmailMessageToJson(this);
}


/*
 Email _$EmailFromJson(Map<String, dynamic> json) => Email(
      id: json['id'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      deletedAt: DateTime.tryParse((json['deletedAt'] ?? '') as String),
      lastSyncedAt: DateTime.tryParse((json['lastSyncedAt'] ?? '') as String),
      email: json['email'] as String,
    );

Map<String, dynamic> _$EmailToJson(Email instance) => <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'deletedAt': instance.deletedAt?.toIso8601String(),
      'lastSyncedAt': instance.lastSyncedAt?.toIso8601String(),
      'email': instance.email,
    };

*/