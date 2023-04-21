// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LessonInfo _$LessonInfoFromJson(Map<String, dynamic> json) => LessonInfo(
      lessonId: json['lessonId'] as String?,
      lesson: json['lesson'] == null
          ? null
          : Lesson.fromJson(json['lesson'] as Map<String, dynamic>),
      studentId: json['studentId'] as String?,
      isPresent: json['isPresent'] as bool?,
      isPermitted: json['isPermitted'] as bool?,
      reason: json['reason'] as String?,
      note: json['note'] as String?,
      isDone: json['isDone'] as bool?,
      score: (json['score'] as num?)?.toDouble(),
      attitude: (json['attitude'] as num?)?.toDouble(),
      result: (json['result'] as num?)?.toDouble(),
      review: json['review'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$LessonInfoToJson(LessonInfo instance) =>
    <String, dynamic>{
      'lessonId': instance.lessonId,
      'lesson': instance.lesson?.toJson(),
      'studentId': instance.studentId,
      'isPresent': instance.isPresent,
      'isPermitted': instance.isPermitted,
      'reason': instance.reason,
      'note': instance.note,
      'isDone': instance.isDone,
      'score': instance.score,
      'attitude': instance.attitude,
      'result': instance.result,
      'review': instance.review,
      'id': instance.id,
    };
