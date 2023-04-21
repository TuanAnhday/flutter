import 'package:ai_care/models/exam/exam_teacher.dart';
import 'package:json_annotation/json_annotation.dart';

import '../class/class.dart';
part 'exam.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class Exam {

  Exam({
    this.name,
    this.subjectId,
    this.examType,
    this.courseId,
    this.classId,
    this.classData,
    this.note,
    this.examDate,
    this.examHour,
    this.examMinute,
    this.examMethod,
    this.classroomId,
    this.studentJoinCount,
    this.examTeachers,
    this.tenantId,
    this.trainingCenterId,
    this.isGeneralOffice,
    this.id,
  });

  factory Exam.fromJson(Map<String, dynamic> json) => _$ExamFromJson(json);
  String? name;
  String? subjectId;
  int? examType;
  String? courseId;
  String? classId;
  ClassData? classData;
  String? note;
  DateTime? examDate;
  String? examHour;
  int? examMinute;
  int? examMethod;
  String? classroomId;
  int? studentJoinCount;
  List<ExamTeacher>? examTeachers;
  String? tenantId;
  String? trainingCenterId;
  bool? isGeneralOffice;
  String? id;

  Map<String, dynamic> toJson() => _$ExamToJson(this);
}

