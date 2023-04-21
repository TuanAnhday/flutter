// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_plan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoursePlan _$CoursePlanFromJson(Map<String, dynamic> json) => CoursePlan(
      subjectId: json['subjectId'] as String?,
      subject: json['subject'] == null
          ? null
          : SubjectData.fromJson(json['subject'] as Map<String, dynamic>),
      courseId: json['courseId'] as String?,
      course: json['course'] == null
          ? null
          : Course.fromJson(json['course'] as Map<String, dynamic>),
      curriculum: json['curriculum'] as String?,
      numberOfSession: json['numberOfSession'] as int?,
      coursePlanDetails: (json['coursePlanDetails'] as List<dynamic>?)
          ?.map((e) => CoursePlanDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdBy: json['createdBy'] == null
          ? null
          : UserData.fromJson(json['createdBy'] as Map<String, dynamic>),
      id: json['id'] as String?,
    );

Map<String, dynamic> _$CoursePlanToJson(CoursePlan instance) =>
    <String, dynamic>{
      'subjectId': instance.subjectId,
      'subject': instance.subject?.toJson(),
      'courseId': instance.courseId,
      'course': instance.course?.toJson(),
      'curriculum': instance.curriculum,
      'numberOfSession': instance.numberOfSession,
      'coursePlanDetails':
          instance.coursePlanDetails?.map((e) => e.toJson()).toList(),
      'createdBy': instance.createdBy?.toJson(),
      'id': instance.id,
    };
