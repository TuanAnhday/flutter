import 'package:json_annotation/json_annotation.dart';

part 'parent.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class Parent {
  Parent({
    required this.name,
    this.dob,
    this.relationship,
    this.phone,
    this.email,
    this.address,
    this.note,
    this.studentId,
    this.id,
  });
  factory Parent.fromJson(Map<String, dynamic> json) => _$ParentFromJson(json);

  String name;
  DateTime? dob;
  int? relationship;
  String? phone;
  String? email;
  String? address;
  String? note;
  String? studentId;
  String? id;

  Map<String, dynamic> toJson() => _$ParentToJson(this);

}
