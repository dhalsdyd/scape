// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Field _$FieldFromJson(Map<String, dynamic> json) => Field(
      id: json['id'] as String,
      name: json['name'] as String,
      value: json['value'] as String,
      emoji: json['emoji'] as String,
      hidePreview: json['hidePreview'] as bool,
      description: json['description'] as String,
    );

Map<String, dynamic> _$FieldToJson(Field instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'value': instance.value,
      'emoji': instance.emoji,
      'hidePreview': instance.hidePreview,
      'description': instance.description,
    };

Account _$AccountFromJson(Map<String, dynamic> json) => Account(
      id: json['id'] as String,
      name: json['name'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      stared: json['stared'] as bool,
      fields: (json['fields'] as List<dynamic>)
          .map((e) => Field.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AccountToJson(Account instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'createdAt': instance.createdAt.toIso8601String(),
      'stared': instance.stared,
      'fields': instance.fields,
    };
