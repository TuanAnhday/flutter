import 'package:json_annotation/json_annotation.dart';

part 'class_manager.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class ClassManager {
  ClassManager({
    required this.classId,
    required this.employeeId,
    required this.id,
  });

  factory ClassManager.fromJson(Map<String, dynamic> json) => _$ClassManagerFromJson(json);

  String classId;
  String employeeId;
  String id;

  Map<String, dynamic> toJson() => _$ClassManagerToJson(this);
}
