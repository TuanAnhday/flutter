import 'package:ai_care/models/teacher/teacher.dart';
import 'package:json_annotation/json_annotation.dart';

import '../classroom/classroom.dart';

part 'class_schedule.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class ClassSchedule {
  ClassSchedule({
    this.dayOfWeek,
    this.startTime,
    this.endTime,
    this.classroomId,
    this.classroom,
    this.teacherId,
    this.teachers,
    this.tutorId,
    this.tutors,
    required this.classId,
    required this.id
  });

  factory ClassSchedule.fromJson(Map<String, dynamic> json) => _$ClassScheduleFromJson(json);

  int? dayOfWeek;
  String? startTime;
  String? endTime;
  String? classroomId;
  Classroom? classroom;
  String? teacherId;
  List<Teacher>? teachers;
  String? tutorId;
  List<Teacher>? tutors;
  String classId;
  String id;

  Map<String, dynamic> toJson() => _$ClassScheduleToJson(this);
}
