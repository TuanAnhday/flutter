// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Exam _$ExamFromJson(Map<String, dynamic> json) => Exam(
      name: json['name'] as String?,
      subjectId: json['subjectId'] as String?,
      examType: json['examType'] as int?,
      courseId: json['courseId'] as String?,
      classId: json['classId'] as String?,
      classData: json['classData'] == null
          ? null
          : ClassData.fromJson(json['classData'] as Map<String, dynamic>),
      note: json['note'] as String?,
      examDate: json['examDate'] == null
          ? null
          : DateTime.parse(json['examDate'] as String),
      examHour: json['examHour'] as String?,
      examMinute: json['examMinute'] as int?,
      examMethod: json['examMethod'] as int?,
      classroomId: json['classroomId'] as String?,
      studentJoinCount: json['studentJoinCount'] as int?,
      examTeachers: (json['examTeachers'] as List<dynamic>?)
          ?.map((e) => ExamTeacher.fromJson(e as Map<String, dynamic>))
          .toList(),
      tenantId: json['tenantId'] as String?,
      trainingCenterId: json['trainingCenterId'] as String?,
      isGeneralOffice: json['isGeneralOffice'] as bool?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$ExamToJson(Exam instance) => <String, dynamic>{
      'name': instance.name,
      'subjectId': instance.subjectId,
      'examType': instance.examType,
      'courseId': instance.courseId,
      'classId': instance.classId,
      'classData': instance.classData?.toJson(),
      'note': instance.note,
      'examDate': instance.examDate?.toIso8601String(),
      'examHour': instance.examHour,
      'examMinute': instance.examMinute,
      'examMethod': instance.examMethod,
      'classroomId': instance.classroomId,
      'studentJoinCount': instance.studentJoinCount,
      'examTeachers': instance.examTeachers?.map((e) => e.toJson()).toList(),
      'tenantId': instance.tenantId,
      'trainingCenterId': instance.trainingCenterId,
      'isGeneralOffice': instance.isGeneralOffice,
      'id': instance.id,
    };
