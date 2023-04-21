import 'package:ai_care/models/teacher/teacher.dart';
import 'package:json_annotation/json_annotation.dart';

import '../lesson/lesson.dart';

part 'lesson_employee.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class LessonEmployee {

  LessonEmployee({this.lessonId, this.lesson, this.teacher, this.id});

  factory LessonEmployee.fromJson(Map<String, dynamic> json) => _$LessonEmployeeFromJson(json);
  String? lessonId;
  Lesson? lesson;
  String? teacherId;
  Teacher? teacher;
  String? id;

  Map<String, dynamic> toJson() => _$LessonEmployeeToJson(this);
}
