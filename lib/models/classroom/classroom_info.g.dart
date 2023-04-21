// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'classroom_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClassroomInfo _$ClassroomInfoFromJson(Map<String, dynamic> json) =>
    ClassroomInfo(
      classroomState: json['classroomState'] as int?,
      capacity: json['capacity'] as int?,
      ageGroup: json['ageGroup'] as int?,
      classroomId: json['classroomId'] as String?,
      createdBy: json['createdBy'] == null
          ? null
          : UserData.fromJson(json['createdBy'] as Map<String, dynamic>),
      createDate: json['createDate'] == null
          ? null
          : DateTime.parse(json['createDate'] as String),
      tenantId: json['tenantId'] as String?,
      trainingCenterId: json['trainingCenterId'] as String?,
      isGeneralOffice: json['isGeneralOffice'] as bool?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$ClassroomInfoToJson(ClassroomInfo instance) =>
    <String, dynamic>{
      'classroomState': instance.classroomState,
      'capacity': instance.capacity,
      'ageGroup': instance.ageGroup,
      'classroomId': instance.classroomId,
      'createdBy': instance.createdBy?.toJson(),
      'createDate': instance.createDate?.toIso8601String(),
      'tenantId': instance.tenantId,
      'trainingCenterId': instance.trainingCenterId,
      'isGeneralOffice': instance.isGeneralOffice,
      'id': instance.id,
    };
