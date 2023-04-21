// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam_teacher.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExamTeacher _$ExamTeacherFromJson(Map<String, dynamic> json) => ExamTeacher(
      employeeId: json['employeeId'] as String?,
      employee: json['employee'] == null
          ? null
          : Employee.fromJson(json['employee'] as Map<String, dynamic>),
      examId: json['examId'] as String?,
      examTeacherType: json['examTeacherType'] as int?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$ExamTeacherToJson(ExamTeacher instance) =>
    <String, dynamic>{
      'employeeId': instance.employeeId,
      'employee': instance.employee?.toJson(),
      'examId': instance.examId,
      'examTeacherType': instance.examTeacherType,
      'id': instance.id,
    };
