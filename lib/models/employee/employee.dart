import 'package:ai_care/models/auth/user/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'employee.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class Employee {

  Employee({
    this.userId,
    this.relativeName,
    this.relativePhoneNumber,
    this.relativeEmail,
    this.relativeAddress,
    this.relation,
    this.user,
    this.bankAccount,
    this.bankNumber,
    this.bankName,
    this.bankBranch,
    this.createdBy,
    this.isManagerTrainingCenter,
    this.trainingCenterId,
    this.isGeneralOffice,
    this.id,
  });
  factory Employee.fromJson(Map<String, dynamic> json) => _$EmployeeFromJson(json);

  String? userId;
  String? relativeName;
  String? relativePhoneNumber;
  String? relativeEmail;
  String? relativeAddress;
  int? relation;
  UserData? user;
  String? bankAccount;
  String? bankNumber;
  String? bankName;
  String? bankBranch;
  String? createdBy;
  bool? isManagerTrainingCenter;
  String? trainingCenterId;
  bool? isGeneralOffice;
  String? id;

  Map<String, dynamic> toJson() => _$EmployeeToJson(this);

}
