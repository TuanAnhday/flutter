// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Wallet _$WalletFromJson(Map<String, dynamic> json) => Wallet(
      studentId: json['studentId'] as String?,
      student: json['student'] == null
          ? null
          : Student.fromJson(json['student'] as Map<String, dynamic>),
      subjectId: json['subjectId'] as String?,
      subject: json['subject'] == null
          ? null
          : Subject.fromJson(json['subject'] as Map<String, dynamic>),
      courseId: json['courseId'] as String?,
      course: json['course'] == null
          ? null
          : Course.fromJson(json['course'] as Map<String, dynamic>),
      registrationCount: json['registrationCount'] as int?,
      tuition: (json['tuition'] as num).toDouble(),
      amount: (json['amount'] as num).toDouble(),
      discountAmount: (json['discountAmount'] as num).toDouble(),
      discountPercent: (json['discountPercent'] as num).toDouble(),
      totalAmount: (json['totalAmount'] as num).toDouble(),
      paymentMethod: json['paymentMethod'] as int?,
      numberOfPayment: json['numberOfPayment'] as int,
      paidAmount: (json['paidAmount'] as num).toDouble(),
      paymentAmount: (json['paymentAmount'] as num).toDouble(),
      surplusAmount: (json['surplusAmount'] as num).toDouble(),
      dueAmount: (json['dueAmount'] as num).toDouble(),
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      moneyFundId: json['moneyFundId'] as String?,
      tenantId: json['tenantId'] as String?,
      trainingCenterId: json['trainingCenterId'] as String?,
      isGeneralOffice: json['isGeneralOffice'] as bool,
    );

Map<String, dynamic> _$WalletToJson(Wallet instance) => <String, dynamic>{
      'studentId': instance.studentId,
      'student': instance.student?.toJson(),
      'subjectId': instance.subjectId,
      'subject': instance.subject?.toJson(),
      'courseId': instance.courseId,
      'course': instance.course?.toJson(),
      'registrationCount': instance.registrationCount,
      'tuition': instance.tuition,
      'amount': instance.amount,
      'discountAmount': instance.discountAmount,
      'discountPercent': instance.discountPercent,
      'totalAmount': instance.totalAmount,
      'paymentMethod': instance.paymentMethod,
      'numberOfPayment': instance.numberOfPayment,
      'paidAmount': instance.paidAmount,
      'paymentAmount': instance.paymentAmount,
      'surplusAmount': instance.surplusAmount,
      'dueAmount': instance.dueAmount,
      'createdDate': instance.createdDate?.toIso8601String(),
      'moneyFundId': instance.moneyFundId,
      'tenantId': instance.tenantId,
      'trainingCenterId': instance.trainingCenterId,
      'isGeneralOffice': instance.isGeneralOffice,
    };
