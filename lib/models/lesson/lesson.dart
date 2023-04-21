import 'package:ai_care/models/activity/activity.dart';
import 'package:ai_care/models/lesson-employee/lesson_employee.dart';
import 'package:ai_care/models/lesson-info/lesson_info.dart';
import 'package:json_annotation/json_annotation.dart';

import '../class/class.dart';

part 'lesson.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class Lesson {
  Lesson({
    this.classId,
    this.classData,
    this.sessionOrder,
    this.sessionDate,
    this.homework,
    this.lessonInfos,
    this.activities,
    this.isConfirmed,
    this.isResulted,
    this.isAttendance,
    this.firstAttendanceTime,
    this.lessonEmployees,
    this.id,
  });

  factory Lesson.fromJson(Map<String, dynamic> json) => _$LessonFromJson(json);

  String? classId;
  ClassData? classData;
  int? sessionOrder;
  DateTime? sessionDate;
  String? homework;
  List<LessonInfo>? lessonInfos;
  List<Activity>? activities;
  bool? isConfirmed;
  bool? isResulted;
  bool? isAttendance;
  DateTime? firstAttendanceTime;
  List<LessonEmployee>? lessonEmployees;
  String? id;

  Map<String, dynamic> toJson() => _$LessonToJson(this);
}
