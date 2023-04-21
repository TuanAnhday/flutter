import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';
@JsonSerializable(includeIfNull: true, explicitToJson: true)
class UserData {
  UserData({
    this.id,
    this.userName,
    this.email,
    this.parentId,
    this.roleIds,
    this.fullName,
    this.idNumber,
    this.phoneNumber,
    this.address,
    this.active,
    this.gender,
    this.dob,
    this.createdDate,
    this.unitName,
    this.unitAddress,
    this.taxCode,
    this.representativeName,
    this.representativePhoneNumber,
    this.representativeEmail,
    this.imageUrl
  });

  factory UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);
  String? id;
  String? userName;
  String? email;
  String? parentId;
  List<String>? roleIds;
  String? fullName;
  String? idNumber;
  String? phoneNumber;
  String? address;
  String? active;
  int? gender;
  DateTime? dob;
  String? createdDate;
  String? unitName;
  String? unitAddress;
  String? taxCode;
  String? representativeName;
  String? representativePhoneNumber;
  String? representativeEmail;
  String? imageUrl;

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}