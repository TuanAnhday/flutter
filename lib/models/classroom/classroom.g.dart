// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'classroom.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Classroom _$ClassroomFromJson(Map<String, dynamic> json) => Classroom(
      name: json['name'] as String?,
      floor: json['floor'] as int?,
      description: json['description'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$ClassroomToJson(Classroom instance) => <String, dynamic>{
      'name': instance.name,
      'floor': instance.floor,
      'description': instance.description,
      'id': instance.id,
    };
