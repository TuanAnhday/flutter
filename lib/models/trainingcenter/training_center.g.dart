// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'training_center.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrainingCenter _$TrainingCenterFromJson(Map<String, dynamic> json) =>
    TrainingCenter(
      name: json['name'] as String,
      abbreviation: json['abbreviation'] as String?,
      companyName: json['companyName'] as String?,
      taxCode: json['taxCode'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      email: json['email'] as String?,
      district: json['district'] as String?,
      address: json['address'] as String?,
      centerType: json['centerType'] == null
          ? null
          : CenterType.fromJson(json['centerType'] as Map<String, dynamic>),
      subject: json['subject'] == null
          ? null
          : Subject.fromJson(json['subject'] as Map<String, dynamic>),
      tenants: (json['tenants'] as List<dynamic>?)
          ?.map((e) => Tenant.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TrainingCenterToJson(TrainingCenter instance) =>
    <String, dynamic>{
      'name': instance.name,
      'abbreviation': instance.abbreviation,
      'companyName': instance.companyName,
      'taxCode': instance.taxCode,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'district': instance.district,
      'address': instance.address,
      'centerType': instance.centerType?.toJson(),
      'subject': instance.subject?.toJson(),
      'tenants': instance.tenants?.map((e) => e.toJson()).toList(),
    };

CenterType _$CenterTypeFromJson(Map<String, dynamic> json) => CenterType(
      name: json['name'] as String,
      id: json['id'] as String,
    );

Map<String, dynamic> _$CenterTypeToJson(CenterType instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
    };
