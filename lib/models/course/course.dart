import 'package:ai_care/models/auth/user/user.dart';
import 'package:ai_care/models/wallet/wallet.dart';
import 'package:json_annotation/json_annotation.dart';

import '../class/class.dart';

part 'course.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class Course {
  Course({
    this.courseName,
    this.courseId,
    this.curriculum,
    this.eLearning,
    this.description,
    this.status,
    this.numberOfSession,
    required this.price,
    this.minNumberOfStudent,
    this.maxNumberOfStudent,
    required this.createdDate,
    required this.createdBy,
    required this.trainingCenterId,
    this.classes,
    this.wallets,
    required this.id,
  });

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);

  String? courseName;
  String? courseId;
  String? curriculum;
  String? eLearning;
  String? description;
  int? status;
  int? numberOfSession;
  int? price;
  int? minNumberOfStudent;
  int? maxNumberOfStudent;
  DateTime? createdDate;
  UserData? createdBy;
  String? trainingCenterId;
  List<ClassData>? classes;
  List<Wallet>? wallets;
  String id;

  Map<String, dynamic> toJson() => _$CourseToJson(this);
}