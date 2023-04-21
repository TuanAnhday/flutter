// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExamDetail _$ExamDetailFromJson(Map<String, dynamic> json) => ExamDetail(
      examId: json['examId'] as String?,
      exam: json['exam'] == null
          ? null
          : Exam.fromJson(json['exam'] as Map<String, dynamic>),
      examDetailStudents: (json['examDetailStudents'] as List<dynamic>?)
          ?.map((e) => ExamDetailStudent.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as String?,
    );

Map<String, dynamic> _$ExamDetailToJson(ExamDetail instance) =>
    <String, dynamic>{
      'examId': instance.examId,
      'exam': instance.exam?.toJson(),
      'examDetailStudents':
          instance.examDetailStudents?.map((e) => e.toJson()).toList(),
      'id': instance.id,
    };
