import 'package:json_annotation/json_annotation.dart';

import '../employee/employee.dart';

part 'exam_teacher.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class ExamTeacher {
  ExamTeacher({
    this.employeeId,
    this.employee,
    this.examId,
    this.examTeacherType,
    this.id,
  });

  factory ExamTeacher.fromJson(Map<String, dynamic> json) => _$ExamTeacherFromJson(json);
  String? employeeId;
  Employee? employee;
  String? examId;
  int? examTeacherType;
  String? id;

  Map<String, dynamic> toJson() => _$ExamTeacherToJson(this);
}
