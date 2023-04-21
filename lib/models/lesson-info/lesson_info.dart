import 'package:ai_care/models/lesson/lesson.dart';
import 'package:json_annotation/json_annotation.dart';

part 'lesson_info.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class LessonInfo {

  LessonInfo({
    this.lessonId,
    this.lesson,
    this.studentId,
    this.isPresent,
    this.isPermitted,
    this.reason,
    this.note,
    this.isDone,
    this.score,
    this.attitude,
    this.result,
    this.review,
    this.id,
  });

  factory LessonInfo.fromJson(Map<String, dynamic> json) => _$LessonInfoFromJson(json);
  String? lessonId;
  Lesson? lesson;
  String? studentId;
  bool? isPresent;
  bool? isPermitted;
  String? reason;
  String? note;
  bool? isDone;
  double? score;
  double? attitude;
  double? result;
  String? review;
  String? id;

  Map<String, dynamic> toJson() => _$LessonInfoToJson(this);
}
