// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Activity _$ActivityFromJson(Map<String, dynamic> json) => Activity(
      classId: json['classId'] as String?,
      type: json['type'] as int?,
      lesson: json['lesson'] as int?,
      topic: json['topic'] as String?,
      homework: json['homework'] as String?,
      content: json['content'] as String?,
      note: json['note'] as String?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      startTime: json['startTime'] as String?,
      endTime: json['endTime'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$ActivityToJson(Activity instance) => <String, dynamic>{
      'classId': instance.classId,
      'type': instance.type,
      'lesson': instance.lesson,
      'topic': instance.topic,
      'homework': instance.homework,
      'content': instance.content,
      'note': instance.note,
      'date': instance.date?.toIso8601String(),
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'id': instance.id,
    };
