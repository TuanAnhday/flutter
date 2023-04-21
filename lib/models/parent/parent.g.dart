// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parent.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Parent _$ParentFromJson(Map<String, dynamic> json) => Parent(
      name: json['name'] as String,
      dob: json['dob'] == null ? null : DateTime.parse(json['dob'] as String),
      relationship: json['relationship'] as int?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      address: json['address'] as String?,
      note: json['note'] as String?,
      studentId: json['studentId'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$ParentToJson(Parent instance) => <String, dynamic>{
      'name': instance.name,
      'dob': instance.dob?.toIso8601String(),
      'relationship': instance.relationship,
      'phone': instance.phone,
      'email': instance.email,
      'address': instance.address,
      'note': instance.note,
      'studentId': instance.studentId,
      'id': instance.id,
    };
