import 'package:ai_care/models/auth/user/user.dart';
import 'package:ai_care/models/course/course.dart';
import 'package:ai_care/models/subject/subject_data.dart';
import 'package:json_annotation/json_annotation.dart';

import 'course_plan_detail.dart';


part 'course_plan.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class CoursePlan {
  CoursePlan({
    this.subjectId,
    this.subject,
    this.courseId,
    this.course,
    this.curriculum,
    this.numberOfSession,
    this.coursePlanDetails,
    this.createdBy,
    this.id
  });

  factory CoursePlan.fromJson(Map<String, dynamic> json) => _$CoursePlanFromJson(json);

  String? subjectId;
  SubjectData? subject;
  String? courseId;
  Course? course;
  String? curriculum;
  int? numberOfSession;
  List<CoursePlanDetail>? coursePlanDetails;
  UserData? createdBy;
  String? id;

  Map<String, dynamic> toJson() => _$CoursePlanToJson(this);
}