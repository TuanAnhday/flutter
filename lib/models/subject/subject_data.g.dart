// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubjectData _$SubjectDataFromJson(Map<String, dynamic> json) => SubjectData(
      name: json['name'] as String?,
      description: json['description'] as String?,
      createDate: json['createDate'] == null
          ? null
          : DateTime.parse(json['createDate'] as String),
      createdBy: json['createdBy'] == null
          ? null
          : UserData.fromJson(json['createdBy'] as Map<String, dynamic>),
      trainingCenterId: json['trainingCenterId'] as String?,
      isActive: json['isActive'] as bool?,
      subjectType: json['subjectType'] as int?,
      courseInSubject: json['courseInSubject'] as int?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$SubjectDataToJson(SubjectData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'createDate': instance.createDate?.toIso8601String(),
      'createdBy': instance.createdBy?.toJson(),
      'trainingCenterId': instance.trainingCenterId,
      'isActive': instance.isActive,
      'subjectType': instance.subjectType,
      'courseInSubject': instance.courseInSubject,
      'id': instance.id,
    };
