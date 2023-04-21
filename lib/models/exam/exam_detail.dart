import 'package:ai_care/models/exam/exam.dart';
import 'package:ai_care/models/exam/exam_detail_student.dart';
import 'package:json_annotation/json_annotation.dart';

part 'exam_detail.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class ExamDetail {

  ExamDetail({
    this.examId,
    this.exam,
    this.examDetailStudents,
    this.id,
  });

  factory ExamDetail.fromJson(Map<String, dynamic> json) => _$ExamDetailFromJson(json);
  String? examId;
  Exam? exam;
  List<ExamDetailStudent>? examDetailStudents;
  String? id;

  Map<String, dynamic> toJson() => _$ExamDetailToJson(this);
}
