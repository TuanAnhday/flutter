import 'package:ai_care/models/master/subject/subject.dart';
import 'package:ai_care/models/student/student.dart';
import 'package:json_annotation/json_annotation.dart';

import '../course/course.dart';

part 'wallet.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class Wallet {
  Wallet({
    this.studentId,
    this.student,
    this.subjectId,
    this.subject,
    this.courseId,
    this.course,
    this.registrationCount,
    required this.tuition,
    required this.amount,
    required this.discountAmount,
    required this.discountPercent,
    required this.totalAmount,
    this.paymentMethod,
    required this.numberOfPayment,
    required this.paidAmount,
    required this.paymentAmount,
    required this.surplusAmount,
    required this.dueAmount,
    this.createdDate,
    this.moneyFundId,
    this.tenantId,
    this.trainingCenterId,
    required this.isGeneralOffice,
  });

  factory Wallet.fromJson(Map<String, dynamic> json) => _$WalletFromJson(json);

  String? studentId;
  Student? student;
  String? subjectId;
  Subject? subject;
  String? courseId;
  Course? course;
  int? registrationCount;
  double tuition;
  double amount;
  double discountAmount;
  double discountPercent;
  double totalAmount;
  int? paymentMethod;
  int numberOfPayment;
  double paidAmount;
  double paymentAmount;
  double surplusAmount;
  double dueAmount;
  DateTime? createdDate;
  String? moneyFundId;
  String? tenantId;
  String? trainingCenterId;
  bool isGeneralOffice;

  Map<String, dynamic> toJson() => _$WalletToJson(this);
}
