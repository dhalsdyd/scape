// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'email.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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

EmailMessage _$EmailMessageFromJson(Map<String, dynamic> json) => EmailMessage(
    id: json['id'] as String,
    createdAt: DateTime.parse(json['createdAt'] as String),
    receivedAt: DateTime.parse(json['receivedAt'] as String),
    from: json['from'] as String,
    to: json['to'] as String,
    text: json['text'] as String,
    html: json['html'] as String);

Map<String, dynamic> _$EmailMessageToJson(EmailMessage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'receivedAt': instance.receivedAt.toIso8601String(),
      'from': instance.from,
      'to': instance.to,
      'text': instance.text,
      'html': instance.html,
    };
