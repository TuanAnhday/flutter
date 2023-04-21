// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'class_schedule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClassSchedule _$ClassScheduleFromJson(Map<String, dynamic> json) =>
    ClassSchedule(
      dayOfWeek: json['dayOfWeek'] as int?,
      startTime: json['startTime'] as String?,
      endTime: json['endTime'] as String?,
      classroomId: json['classroomId'] as String?,
      classroom: json['classroom'] == null
          ? null
          : Classroom.fromJson(json['classroom'] as Map<String, dynamic>),
      teacherId: json['teacherId'] as String?,
      teachers: (json['teachers'] as List<dynamic>?)
          ?.map((e) => Teacher.fromJson(e as Map<String, dynamic>))
          .toList(),
      tutorId: json['tutorId'] as String?,
      tutors: (json['tutors'] as List<dynamic>?)
          ?.map((e) => Teacher.fromJson(e as Map<String, dynamic>))
          .toList(),
      classId: json['classId'] as String,
      id: json['id'] as String,
    );

Map<String, dynamic> _$ClassScheduleToJson(ClassSchedule instance) =>
    <String, dynamic>{
      'dayOfWeek': instance.dayOfWeek,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'classroomId': instance.classroomId,
      'classroom': instance.classroom?.toJson(),
      'teacherId': instance.teacherId,
      'teachers': instance.teachers?.map((e) => e.toJson()).toList(),
      'tutorId': instance.tutorId,
      'tutors': instance.tutors?.map((e) => e.toJson()).toList(),
      'classId': instance.classId,
      'id': instance.id,
    };
