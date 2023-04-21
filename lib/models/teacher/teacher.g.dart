// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teacher.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Teacher _$TeacherFromJson(Map<String, dynamic> json) => Teacher(
      scheduleId: json['scheduleId'] as String?,
      schedule: json['schedule'] == null
          ? null
          : ClassSchedule.fromJson(json['schedule'] as Map<String, dynamic>),
      employeeId: json['employeeId'] as String?,
      employee: json['employee'] == null
          ? null
          : Employee.fromJson(json['employee'] as Map<String, dynamic>),
      id: json['id'] as String?,
    );

Map<String, dynamic> _$TeacherToJson(Teacher instance) => <String, dynamic>{
      'scheduleId': instance.scheduleId,
      'schedule': instance.schedule?.toJson(),
      'employeeId': instance.employeeId,
      'employee': instance.employee?.toJson(),
      'id': instance.id,
    };
