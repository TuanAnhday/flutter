// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learning_class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LearningClass _$LearningClassFromJson(Map<String, dynamic> json) =>
    LearningClass(
      classId: json['classId'] as String?,
      classData: json['classData'] == null
          ? null
          : ClassData.fromJson(json['classData'] as Map<String, dynamic>),
      status: json['status'] as int?,
      learning: json['learning'] as int?,
      avgLearning: (json['avgLearning'] as num?)?.toDouble(),
      avgHomework: (json['avgHomework'] as num?)?.toDouble(),
      avgAttitude: (json['avgAttitude'] as num?)?.toDouble(),
      avgResult: (json['avgResult'] as num?)?.toDouble(),
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      numberOfLessons: json['numberOfLessons'] as int?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$LearningClassToJson(LearningClass instance) =>
    <String, dynamic>{
      'classId': instance.classId,
      'classData': instance.classData?.toJson(),
      'status': instance.status,
      'learning': instance.learning,
      'avgLearning': instance.avgLearning,
      'avgHomework': instance.avgHomework,
      'avgAttitude': instance.avgAttitude,
      'avgResult': instance.avgResult,
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'numberOfLessons': instance.numberOfLessons,
      'id': instance.id,
    };
