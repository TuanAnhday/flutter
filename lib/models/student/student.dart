import 'package:ai_care/models/admissions_channel/admissions_channel.dart';
import 'package:ai_care/models/auth/user/user.dart';
import 'package:ai_care/models/parent/parent.dart';
import 'package:ai_care/models/tenant/tenant.dart';
import 'package:json_annotation/json_annotation.dart';

part 'student.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class Student {
  Student({
    required this.hasStudent,
    required this.name,
    this.genderOption,
    this.doB,
    this.phoneNumber,
    this.email,
    this.address,
    this.school,
    this.rankedAcademic,
    this.personality,
    this.hobby,
    this.note,
    this.studentInfo,
    this.hasParent,
    this.parents,
    this.id,
  });

  factory Student.fromJson(Map<String, dynamic> json) => _$StudentFromJson(json);

  bool hasStudent;
  String name;
  int? genderOption;
  DateTime? doB;
  String? phoneNumber;
  String? email;
  String? address;
  String? school;
  int? rankedAcademic;
  String? personality;
  String? hobby;
  String? note;
  StudentInfo? studentInfo;
  bool? hasParent;
  List<Parent>? parents;
  String? id;

  Map<String, dynamic> toJson() => _$StudentToJson(this);
}

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class StudentInfo {
  StudentInfo({
    this.tenant,
    this.serviceState,
    this.adviser,
    this.admissionsChannel,
    this.createdByUser,
    this.parentUser,
    this.user,
  });

  factory StudentInfo.fromJson(Map<String, dynamic> json) => _$StudentInfoFromJson(json);

  Tenant? tenant;
  int? serviceState;
  UserData? adviser;
  AdmissionsChannel? admissionsChannel;
  UserData? createdByUser;
  UserData? parentUser;
  UserData? user;

  Map<String, dynamic> toJson() => _$StudentInfoToJson(this);
}
