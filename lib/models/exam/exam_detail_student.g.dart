// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam_detail_student.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExamDetailStudent _$ExamDetailStudentFromJson(Map<String, dynamic> json) =>
    ExamDetailStudent(
      examDetailId: json['examDetailId'] as String?,
      examDetail: json['examDetail'] == null
          ? null
          : ExamDetail.fromJson(json['examDetail'] as Map<String, dynamic>),
      studentId: json['studentId'] as String?,
      student: json['student'] == null
          ? null
          : Student.fromJson(json['student'] as Map<String, dynamic>),
      score: (json['score'] as num?)?.toDouble(),
      comment: json['comment'] as String?,
      examDate: json['examDate'] == null
          ? null
          : DateTime.parse(json['examDate'] as String),
      classId: json['classId'] as String?,
      employeeId: json['employeeId'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$ExamDetailStudentToJson(ExamDetailStudent instance) =>
    <String, dynamic>{
      'examDetailId': instance.examDetailId,
      'examDetail': instance.examDetail?.toJson(),
      'studentId': instance.studentId,
      'student': instance.student?.toJson(),
      'score': instance.score,
      'comment': instance.comment,
      'examDate': instance.examDate?.toIso8601String(),
      'classId': instance.classId,
      'employeeId': instance.employeeId,
      'id': instance.id,
    };
