// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClassData _$ClassDataFromJson(Map<String, dynamic> json) => ClassData(
      className: json['className'] as String?,
      normalizedName: json['normalizedName'] as String?,
      courseId: json['courseId'] as String?,
      foreignTeacherRate: (json['foreignTeacherRate'] as num?)?.toDouble(),
      numberOfLessons: json['numberOfLessons'] as int?,
      duration: json['duration'] as int?,
      note: json['note'] as String?,
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      classSchedules: (json['classSchedules'] as List<dynamic>?)
          ?.map((e) => ClassSchedule.fromJson(e as Map<String, dynamic>))
          .toList(),
      classStatus: json['classStatus'] as int?,
      trialNumberOfLessons: json['trialNumberOfLessons'] as int?,
      managers: (json['managers'] as List<dynamic>?)
          ?.map((e) => ClassManager.fromJson(e as Map<String, dynamic>))
          .toList(),
      lessons: (json['lessons'] as List<dynamic>?)
          ?.map((e) => Lesson.fromJson(e as Map<String, dynamic>))
          .toList(),
      course: json['course'] == null
          ? null
          : Course.fromJson(json['course'] as Map<String, dynamic>),
      tenantId: json['tenantId'] as String?,
      numberLearned: json['numberLearned'] as int?,
      trainingCenterId: json['trainingCenterId'] as String?,
      isGeneralOffice: json['isGeneralOffice'] as bool?,
      modifiedDate: json['modifiedDate'] == null
          ? null
          : DateTime.parse(json['modifiedDate'] as String),
      studentInClass: json['studentInClass'] as int?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$ClassDataToJson(ClassData instance) => <String, dynamic>{
      'className': instance.className,
      'normalizedName': instance.normalizedName,
      'courseId': instance.courseId,
      'foreignTeacherRate': instance.foreignTeacherRate,
      'numberOfLessons': instance.numberOfLessons,
      'duration': instance.duration,
      'note': instance.note,
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'classSchedules':
          instance.classSchedules?.map((e) => e.toJson()).toList(),
      'classStatus': instance.classStatus,
      'trialNumberOfLessons': instance.trialNumberOfLessons,
      'managers': instance.managers?.map((e) => e.toJson()).toList(),
      'lessons': instance.lessons?.map((e) => e.toJson()).toList(),
      'course': instance.course?.toJson(),
      'tenantId': instance.tenantId,
      'numberLearned': instance.numberLearned,
      'trainingCenterId': instance.trainingCenterId,
      'isGeneralOffice': instance.isGeneralOffice,
      'modifiedDate': instance.modifiedDate?.toIso8601String(),
      'studentInClass': instance.studentInClass,
      'id': instance.id,
    };
