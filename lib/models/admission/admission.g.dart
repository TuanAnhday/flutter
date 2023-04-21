// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admission.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Admission _$AdmissionFromJson(Map<String, dynamic> json) => Admission(
      studentId: json['studentId'] as String?,
      student: json['student'] == null
          ? null
          : Student.fromJson(json['student'] as Map<String, dynamic>),
      subjectId: json['subjectId'] as String?,
      subject: json['subject'] == null
          ? null
          : SubjectData.fromJson(json['subject'] as Map<String, dynamic>),
      courseId: json['courseId'] as String?,
      course: json['course'] == null
          ? null
          : Course.fromJson(json['course'] as Map<String, dynamic>),
      classId: json['classId'] as String?,
      classData: json['classData'] == null
          ? null
          : ClassData.fromJson(json['classData'] as Map<String, dynamic>),
      numberOfClass: json['numberOfClass'] as int?,
      remainingLesson: json['remainingLesson'] as int?,
      tuition: (json['tuition'] as num?)?.toDouble(),
      numberOfRegister: json['numberOfRegister'] as int?,
      admissionDate: json['admissionDate'] == null
          ? null
          : DateTime.parse(json['admissionDate'] as String),
      amount: (json['amount'] as num?)?.toDouble(),
      usingWallet: json['usingWallet'] as bool?,
      currentBalanceAmount: (json['currentBalanceAmount'] as num?)?.toDouble(),
      remainingBalanceAmount:
          (json['remainingBalanceAmount'] as num?)?.toDouble(),
      discountPercent: (json['discountPercent'] as num?)?.toDouble(),
      discountAmount: (json['discountAmount'] as num?)?.toDouble(),
      numberOfPayment: json['numberOfPayment'] as int?,
      paymentMethod: json['paymentMethod'] as int?,
      moneyFundId: json['moneyFundId'] as String?,
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      id: json['id'] as String?,
    );

Map<String, dynamic> _$AdmissionToJson(Admission instance) => <String, dynamic>{
      'studentId': instance.studentId,
      'student': instance.student?.toJson(),
      'subjectId': instance.subjectId,
      'subject': instance.subject?.toJson(),
      'courseId': instance.courseId,
      'course': instance.course?.toJson(),
      'classId': instance.classId,
      'classData': instance.classData?.toJson(),
      'numberOfClass': instance.numberOfClass,
      'remainingLesson': instance.remainingLesson,
      'tuition': instance.tuition,
      'numberOfRegister': instance.numberOfRegister,
      'admissionDate': instance.admissionDate?.toIso8601String(),
      'amount': instance.amount,
      'usingWallet': instance.usingWallet,
      'currentBalanceAmount': instance.currentBalanceAmount,
      'remainingBalanceAmount': instance.remainingBalanceAmount,
      'discountPercent': instance.discountPercent,
      'discountAmount': instance.discountAmount,
      'numberOfPayment': instance.numberOfPayment,
      'paymentMethod': instance.paymentMethod,
      'moneyFundId': instance.moneyFundId,
      'createdDate': instance.createdDate?.toIso8601String(),
      'id': instance.id,
    };
