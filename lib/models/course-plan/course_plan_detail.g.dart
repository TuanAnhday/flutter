// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_plan_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoursePlanDetail _$CoursePlanDetailFromJson(Map<String, dynamic> json) =>
    CoursePlanDetail(
      lesson: json['lesson'] as int?,
      topic: json['topic'] as String?,
      content: json['content'] as String?,
      homework: json['homework'] as String?,
      coursePlanId: json['coursePlanId'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$CoursePlanDetailToJson(CoursePlanDetail instance) =>
    <String, dynamic>{
      'lesson': instance.lesson,
      'topic': instance.topic,
      'content': instance.content,
      'homework': instance.homework,
      'coursePlanId': instance.coursePlanId,
      'id': instance.id,
    };
