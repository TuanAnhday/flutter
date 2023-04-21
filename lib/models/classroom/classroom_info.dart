import 'package:ai_care/models/auth/user/user.dart';
import 'package:json_annotation/json_annotation.dart';


part 'classroom_info.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class ClassroomInfo {
  ClassroomInfo({
    this.classroomState,
    this.capacity,
    this.ageGroup,
    this.classroomId,
    this.createdBy,
    this.createDate,
    this.tenantId,
    this.trainingCenterId,
    this.isGeneralOffice,
    this.id
  });

  factory ClassroomInfo.fromJson(Map<String, dynamic> json) => _$ClassroomInfoFromJson(json);

  int? classroomState;
  int? capacity;
  int? ageGroup;
  String? classroomId;
  UserData? createdBy;
  DateTime? createDate;
  String? tenantId;
  String? trainingCenterId;
  bool? isGeneralOffice;
  String? id;

  Map<String, dynamic> toJson() => _$ClassroomInfoToJson(this);
}