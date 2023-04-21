import 'package:json_annotation/json_annotation.dart';

part 'course_plan_detail.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class CoursePlanDetail {
  CoursePlanDetail({this.lesson, this.topic, this.content, this.homework, this.coursePlanId, this.id});

  factory CoursePlanDetail.fromJson(Map<String, dynamic> json) => _$CoursePlanDetailFromJson(json);

  int? lesson;
  String? topic;
  String? content;
  String? homework;
  String? coursePlanId;
  String? id;

  Map<String, dynamic> toJson() => _$CoursePlanDetailToJson(this);
}
