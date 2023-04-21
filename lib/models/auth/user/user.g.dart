// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      id: json['id'] as String?,
      userName: json['userName'] as String?,
      email: json['email'] as String?,
      parentId: json['parentId'] as String?,
      roleIds:
          (json['roleIds'] as List<dynamic>?)?.map((e) => e as String).toList(),
      fullName: json['fullName'] as String?,
      idNumber: json['idNumber'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      address: json['address'] as String?,
      active: json['active'] as String?,
      gender: json['gender'] as int?,
      dob: json['dob'] == null ? null : DateTime.parse(json['dob'] as String),
      createdDate: json['createdDate'] as String?,
      unitName: json['unitName'] as String?,
      unitAddress: json['unitAddress'] as String?,
      taxCode: json['taxCode'] as String?,
      representativeName: json['representativeName'] as String?,
      representativePhoneNumber: json['representativePhoneNumber'] as String?,
      representativeEmail: json['representativeEmail'] as String?,
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'email': instance.email,
      'parentId': instance.parentId,
      'roleIds': instance.roleIds,
      'fullName': instance.fullName,
      'idNumber': instance.idNumber,
      'phoneNumber': instance.phoneNumber,
      'address': instance.address,
      'active': instance.active,
      'gender': instance.gender,
      'dob': instance.dob?.toIso8601String(),
      'createdDate': instance.createdDate,
      'unitName': instance.unitName,
      'unitAddress': instance.unitAddress,
      'taxCode': instance.taxCode,
      'representativeName': instance.representativeName,
      'representativePhoneNumber': instance.representativePhoneNumber,
      'representativeEmail': instance.representativeEmail,
      'imageUrl': instance.imageUrl,
    };
