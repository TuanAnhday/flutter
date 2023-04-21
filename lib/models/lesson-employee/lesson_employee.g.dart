// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson_employee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LessonEmployee _$LessonEmployeeFromJson(Map<String, dynamic> json) =>
    LessonEmployee(
      lessonId: json['lessonId'] as String?,
      lesson: json['lesson'] == null
          ? null
          : Lesson.fromJson(json['lesson'] as Map<String, dynamic>),
      teacher: json['teacher'] == null
          ? null
          : Teacher.fromJson(json['teacher'] as Map<String, dynamic>),
      id: json['id'] as String?,
    )..teacherId = json['teacherId'] as String?;

Map<String, dynamic> _$LessonEmployeeToJson(LessonEmployee instance) =>
    <String, dynamic>{
      'lessonId': instance.lessonId,
      'lesson': instance.lesson?.toJson(),
      'teacherId': instance.teacherId,
      'teacher': instance.teacher?.toJson(),
      'id': instance.id,
    };
