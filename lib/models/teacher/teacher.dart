import 'package:ai_care/models/class/class_schedule.dart';
import 'package:ai_care/models/employee/employee.dart';
import 'package:json_annotation/json_annotation.dart';

part 'teacher.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class Teacher {
  Teacher({
    this.scheduleId,
    this.schedule,
    this.employeeId,
    this.employee,
    this.id,
  });

  factory Teacher.fromJson(Map<String, dynamic> json) => _$TeacherFromJson(json);

  String? scheduleId;
  ClassSchedule? schedule;
  String? employeeId;
  Employee? employee;
  String? id;

  Map<String, dynamic> toJson() => _$TeacherToJson(this);
}
