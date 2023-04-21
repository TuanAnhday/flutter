import 'package:ai_care/models/auth/user/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'subject_data.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class SubjectData {
  SubjectData({
    this.name,
    this.description,
    this.createDate,
    this.createdBy,
    this.trainingCenterId,
    this.isActive,
    this.subjectType,
    this.courseInSubject,
    this.id,
  });

  factory SubjectData.fromJson(Map<String, dynamic> json) => _$SubjectDataFromJson(json);

  String? name;
  String? description;
  DateTime? createDate;
  UserData? createdBy;
  String? trainingCenterId;
  bool? isActive;
  int? subjectType;
  int? courseInSubject;
  String? id;

  Map<String, dynamic> toJson() => _$SubjectDataToJson(this);
}
