import 'package:ai_care/models/class/class_schedule.dart';
import 'package:ai_care/models/course/course.dart';
import 'package:ai_care/models/lesson/lesson.dart';
import 'package:json_annotation/json_annotation.dart';

import 'class_manager.dart';

part 'class.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class ClassData {
  ClassData({
    this.className,
    this.normalizedName,
    this.courseId,
    this.foreignTeacherRate,
    this.numberOfLessons,
    this.duration,
    this.note,
    this.startDate,
    this.endDate,
    this.classSchedules,
    this.classStatus,
    this.trialNumberOfLessons,
    this.managers,
    this.lessons,
    this.course,
    this.tenantId,
    this.numberLearned,
    this.trainingCenterId,
    this.isGeneralOffice,
    this.modifiedDate,
    this.studentInClass,
    this.id,
  });

  factory ClassData.fromJson(Map<String, dynamic> json) => _$ClassDataFromJson(json);

  String? className;
  String? normalizedName;
  String? courseId;
  double? foreignTeacherRate;
  int? numberOfLessons;
  int? duration;
  String? note;
  DateTime? startDate;
  DateTime? endDate;
  List<ClassSchedule>? classSchedules;
  int? classStatus;
  int? trialNumberOfLessons;

  List<ClassManager>? managers;
  List<Lesson>? lessons;
  Course? course;
  String? tenantId;
  int? numberLearned;
  String? trainingCenterId;
  bool? isGeneralOffice;
  DateTime? modifiedDate;
  int? studentInClass;
  String? id;

  Map<String, dynamic> toJson() => _$ClassDataToJson(this);
}

