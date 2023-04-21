// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Student _$StudentFromJson(Map<String, dynamic> json) => Student(
      hasStudent: json['hasStudent'] as bool,
      name: json['name'] as String,
      genderOption: json['genderOption'] as int?,
      doB: json['doB'] == null ? null : DateTime.parse(json['doB'] as String),
      phoneNumber: json['phoneNumber'] as String?,
      email: json['email'] as String?,
      address: json['address'] as String?,
      school: json['school'] as String?,
      rankedAcademic: json['rankedAcademic'] as int?,
      personality: json['personality'] as String?,
      hobby: json['hobby'] as String?,
      note: json['note'] as String?,
      studentInfo: json['studentInfo'] == null
          ? null
          : StudentInfo.fromJson(json['studentInfo'] as Map<String, dynamic>),
      hasParent: json['hasParent'] as bool?,
      parents: (json['parents'] as List<dynamic>?)
          ?.map((e) => Parent.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as String?,
    );

Map<String, dynamic> _$StudentToJson(Student instance) => <String, dynamic>{
      'hasStudent': instance.hasStudent,
      'name': instance.name,
      'genderOption': instance.genderOption,
      'doB': instance.doB?.toIso8601String(),
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'address': instance.address,
      'school': instance.school,
      'rankedAcademic': instance.rankedAcademic,
      'personality': instance.personality,
      'hobby': instance.hobby,
      'note': instance.note,
      'studentInfo': instance.studentInfo?.toJson(),
      'hasParent': instance.hasParent,
      'parents': instance.parents?.map((e) => e.toJson()).toList(),
      'id': instance.id,
    };

StudentInfo _$StudentInfoFromJson(Map<String, dynamic> json) => StudentInfo(
      tenant: json['tenant'] == null
          ? null
          : Tenant.fromJson(json['tenant'] as Map<String, dynamic>),
      serviceState: json['serviceState'] as int?,
      adviser: json['adviser'] == null
          ? null
          : UserData.fromJson(json['adviser'] as Map<String, dynamic>),
      admissionsChannel: json['admissionsChannel'] == null
          ? null
          : AdmissionsChannel.fromJson(
              json['admissionsChannel'] as Map<String, dynamic>),
      createdByUser: json['createdByUser'] == null
          ? null
          : UserData.fromJson(json['createdByUser'] as Map<String, dynamic>),
      parentUser: json['parentUser'] == null
          ? null
          : UserData.fromJson(json['parentUser'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : UserData.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StudentInfoToJson(StudentInfo instance) =>
    <String, dynamic>{
      'tenant': instance.tenant?.toJson(),
      'serviceState': instance.serviceState,
      'adviser': instance.adviser?.toJson(),
      'admissionsChannel': instance.admissionsChannel?.toJson(),
      'createdByUser': instance.createdByUser?.toJson(),
      'parentUser': instance.parentUser?.toJson(),
      'user': instance.user?.toJson(),
    };
