import 'package:json_annotation/json_annotation.dart';

part 'subject.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class Subject {
  Subject({required this.name, required this.createdDate});

  factory Subject.fromJson(Map<String, dynamic> json) => _$SubjectFromJson(json);

  String name;
  DateTime? createdDate;

  Map<String, dynamic> toJson() => _$SubjectToJson(this);
}
