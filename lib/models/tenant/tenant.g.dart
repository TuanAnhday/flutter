// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tenant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tenant _$TenantFromJson(Map<String, dynamic> json) => Tenant(
      name: json['name'] as String,
      phoneNumber: json['phoneNumber'] as String,
      email: json['email'] as String,
      address: json['address'] as String,
      trainingCenterId: json['trainingCenterId'] as String,
      isRoot: json['isRoot'] as bool,
      id: json['id'] as String,
    );

Map<String, dynamic> _$TenantToJson(Tenant instance) => <String, dynamic>{
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'address': instance.address,
      'trainingCenterId': instance.trainingCenterId,
      'isRoot': instance.isRoot,
      'id': instance.id,
    };
