// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Employee _$EmployeeFromJson(Map<String, dynamic> json) => Employee(
      userId: json['userId'] as String?,
      relativeName: json['relativeName'] as String?,
      relativePhoneNumber: json['relativePhoneNumber'] as String?,
      relativeEmail: json['relativeEmail'] as String?,
      relativeAddress: json['relativeAddress'] as String?,
      relation: json['relation'] as int?,
      user: json['user'] == null
          ? null
          : UserData.fromJson(json['user'] as Map<String, dynamic>),
      bankAccount: json['bankAccount'] as String?,
      bankNumber: json['bankNumber'] as String?,
      bankName: json['bankName'] as String?,
      bankBranch: json['bankBranch'] as String?,
      createdBy: json['createdBy'] as String?,
      isManagerTrainingCenter: json['isManagerTrainingCenter'] as bool?,
      trainingCenterId: json['trainingCenterId'] as String?,
      isGeneralOffice: json['isGeneralOffice'] as bool?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$EmployeeToJson(Employee instance) => <String, dynamic>{
      'userId': instance.userId,
      'relativeName': instance.relativeName,
      'relativePhoneNumber': instance.relativePhoneNumber,
      'relativeEmail': instance.relativeEmail,
      'relativeAddress': instance.relativeAddress,
      'relation': instance.relation,
      'user': instance.user?.toJson(),
      'bankAccount': instance.bankAccount,
      'bankNumber': instance.bankNumber,
      'bankName': instance.bankName,
      'bankBranch': instance.bankBranch,
      'createdBy': instance.createdBy,
      'isManagerTrainingCenter': instance.isManagerTrainingCenter,
      'trainingCenterId': instance.trainingCenterId,
      'isGeneralOffice': instance.isGeneralOffice,
      'id': instance.id,
    };
