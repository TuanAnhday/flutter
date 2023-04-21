import 'package:json_annotation/json_annotation.dart';

part 'activity.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class Activity {
  Activity({
    this.classId,
    this.type,
    this.lesson,
    this.topic,
    this.homework,
    this.content,
    this.note,
    this.date,
    this.startTime,
    this.endTime,
    this.id,
  });

  factory Activity.fromJson(Map<String, dynamic> json) => _$ActivityFromJson(json);

  String? classId;
  int? type;
  int? lesson;
  String? topic;
  String? homework;
  String? content;
  String? note;
  DateTime? date;
  String? startTime;
  String? endTime;
  String? id;

  Map<String, dynamic> toJson() => _$ActivityToJson(this);
}
