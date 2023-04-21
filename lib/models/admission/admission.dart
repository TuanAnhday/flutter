import 'package:ai_care/models/course/course.dart';
import 'package:ai_care/models/student/student.dart';
import 'package:ai_care/models/subject/subject_data.dart';
import 'package:json_annotation/json_annotation.dart';

import '../class/class.dart';

part 'admission.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class Admission {
  Admission({
    this.studentId,
    this.student,
    this.subjectId,
    this.subject,
    this.courseId,
    this.course,
    this.classId,
    this.classData,
    this.numberOfClass,
    this.remainingLesson,
    this.tuition,
    this.numberOfRegister,
    this.admissionDate,
    this.amount,
    this.usingWallet,
    this.currentBalanceAmount,
    this.remainingBalanceAmount,
    this.discountPercent,
    this.discountAmount,
    this.numberOfPayment,
    this.paymentMethod,
    this.moneyFundId,
    this.createdDate,
    this.id,
  });

  factory Admission.fromJson(Map<String, dynamic> json) => _$AdmissionFromJson(json);

  String? studentId;
  Student? student;
  String? subjectId;
  SubjectData? subject;
  String? courseId;
  Course? course;
  String? classId;
  ClassData? classData;
  int? numberOfClass;
  int? remainingLesson;
  double? tuition;
  int? numberOfRegister;
  DateTime? admissionDate;
  double? amount;
  bool? usingWallet;
  double? currentBalanceAmount;
  double? remainingBalanceAmount;
  double? discountPercent;
  double? discountAmount;
  int? numberOfPayment;
  int? paymentMethod;
  String? moneyFundId;
  DateTime? createdDate;
  String? id;
  Map<String, dynamic> toJson() => _$AdmissionToJson(this);
}
