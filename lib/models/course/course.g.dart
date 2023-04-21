// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Course _$CourseFromJson(Map<String, dynamic> json) => Course(
      courseName: json['courseName'] as String?,
      courseId: json['courseId'] as String?,
      curriculum: json['curriculum'] as String?,
      eLearning: json['eLearning'] as String?,
      description: json['description'] as String?,
      status: json['status'] as int?,
      numberOfSession: json['numberOfSession'] as int?,
      price: json['price'] as int?,
      minNumberOfStudent: json['minNumberOfStudent'] as int?,
      maxNumberOfStudent: json['maxNumberOfStudent'] as int?,
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      createdBy: json['createdBy'] == null
          ? null
          : UserData.fromJson(json['createdBy'] as Map<String, dynamic>),
      trainingCenterId: json['trainingCenterId'] as String?,
      classes: (json['classes'] as List<dynamic>?)
          ?.map((e) => ClassData.fromJson(e as Map<String, dynamic>))
          .toList(),
      wallets: (json['wallets'] as List<dynamic>?)
          ?.map((e) => Wallet.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as String,
    );

Map<String, dynamic> _$CourseToJson(Course instance) => <String, dynamic>{
      'courseName': instance.courseName,
      'courseId': instance.courseId,
      'curriculum': instance.curriculum,
      'eLearning': instance.eLearning,
      'description': instance.description,
      'status': instance.status,
      'numberOfSession': instance.numberOfSession,
      'price': instance.price,
      'minNumberOfStudent': instance.minNumberOfStudent,
      'maxNumberOfStudent': instance.maxNumberOfStudent,
      'createdDate': instance.createdDate?.toIso8601String(),
      'createdBy': instance.createdBy?.toJson(),
      'trainingCenterId': instance.trainingCenterId,
      'classes': instance.classes?.map((e) => e.toJson()).toList(),
      'wallets': instance.wallets?.map((e) => e.toJson()).toList(),
      'id': instance.id,
    };
