import 'package:json_annotation/json_annotation.dart';


part 'classroom.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class Classroom {
  Classroom({
    this.name,
    this.floor,
    this.description,
    this.id
  });

  factory Classroom.fromJson(Map<String, dynamic> json) => _$ClassroomFromJson(json);

  String? name;
  int? floor;
  String? description;
  String? id;

  Map<String, dynamic> toJson() => _$ClassroomToJson(this);
}

// class ClassroomInfo {
//   ClassroomInfo({
//     this.name,
//     this.floor,
//     this.description,
//     this.id
//   });
//
//   factory ClassroomInfo.fromJson(Map<String, dynamic> json) => _$ClassroomInfoFromJson(json);
//
//   String? name;
//   int? floor;
//   String? description;
//
//   String? id;
//
//   Map<String, dynamic> toJson() => _$ClassroomToJson(this);
// }
