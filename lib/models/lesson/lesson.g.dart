// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Lesson _$LessonFromJson(Map<String, dynamic> json) => Lesson(
      classId: json['classId'] as String?,
      classData: json['classData'] == null
          ? null
          : ClassData.fromJson(json['classData'] as Map<String, dynamic>),
      sessionOrder: json['sessionOrder'] as int?,
      sessionDate: json['sessionDate'] == null
          ? null
          : DateTime.parse(json['sessionDate'] as String),
      homework: json['homework'] as String?,
      lessonInfos: (json['lessonInfos'] as List<dynamic>?)
          ?.map((e) => LessonInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      activities: (json['activities'] as List<dynamic>?)
          ?.map((e) => Activity.fromJson(e as Map<String, dynamic>))
          .toList(),
      isConfirmed: json['isConfirmed'] as bool?,
      isResulted: json['isResulted'] as bool?,
      isAttendance: json['isAttendance'] as bool?,
      firstAttendanceTime: json['firstAttendanceTime'] == null
          ? null
          : DateTime.parse(json['firstAttendanceTime'] as String),
      lessonEmployees: (json['lessonEmployees'] as List<dynamic>?)
          ?.map((e) => LessonEmployee.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as String?,
    );

Map<String, dynamic> _$LessonToJson(Lesson instance) => <String, dynamic>{
      'classId': instance.classId,
      'classData': instance.classData?.toJson(),
      'sessionOrder': instance.sessionOrder,
      'sessionDate': instance.sessionDate?.toIso8601String(),
      'homework': instance.homework,
      'lessonInfos': instance.lessonInfos?.map((e) => e.toJson()).toList(),
      'activities': instance.activities?.map((e) => e.toJson()).toList(),
      'isConfirmed': instance.isConfirmed,
      'isResulted': instance.isResulted,
      'isAttendance': instance.isAttendance,
      'firstAttendanceTime': instance.firstAttendanceTime?.toIso8601String(),
      'lessonEmployees':
          instance.lessonEmployees?.map((e) => e.toJson()).toList(),
      'id': instance.id,
    };
