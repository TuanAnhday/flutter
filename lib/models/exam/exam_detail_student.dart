import 'package:ai_care/models/exam/exam_detail.dart';
import 'package:ai_care/models/student/student.dart';
import 'package:json_annotation/json_annotation.dart';

part 'exam_detail_student.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class ExamDetailStudent {
  ExamDetailStudent({
    this.examDetailId,
    this.examDetail,
    this.studentId,
    this.student,
    this.score,
    this.comment,
    this.examDate,
    this.classId,
    this.employeeId,
    this.id,
  });

  factory ExamDetailStudent.fromJson(Map<String, dynamic> json) => _$ExamDetailStudentFromJson(json);
  String? examDetailId;
  ExamDetail? examDetail;
  String? studentId;
  Student? student;
  double? score;
  String? comment;
  DateTime? examDate;
  String? classId;
  String? employeeId;
  String? id;

  Map<String, dynamic> toJson() => _$ExamDetailStudentToJson(this);
}
