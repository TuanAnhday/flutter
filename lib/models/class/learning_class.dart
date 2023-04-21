import 'package:ai_care/models/class/class.dart';
import 'package:ai_care/models/class/class_schedule.dart';
import 'package:ai_care/models/course/course.dart';
import 'package:json_annotation/json_annotation.dart';

import 'class_manager.dart';

part 'learning_class.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class LearningClass {
  LearningClass({
    this.classId,
    this.classData,
    this.status,
    this.learning,
    this.avgLearning,
    this.avgHomework,
    this.avgAttitude,
    this.avgResult,
    this.startDate,
    this.endDate,
    this.numberOfLessons,
    this.id,
  });

  factory LearningClass.fromJson(Map<String, dynamic> json) => _$LearningClassFromJson(json);

  String? classId;
  ClassData? classData;
  int? status;
  int? learning;
  double? avgLearning;
  double? avgHomework;
  double? avgAttitude;
  double? avgResult;
  DateTime? startDate;
  DateTime? endDate;
  int? numberOfLessons;
  String? id;

  Map<String, dynamic> toJson() => _$LearningClassToJson(this);
}
