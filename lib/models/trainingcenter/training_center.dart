import 'package:ai_care/models/master/subject/subject.dart';
import 'package:ai_care/models/tenant/tenant.dart';
import 'package:json_annotation/json_annotation.dart';

part 'training_center.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class TrainingCenter {
  TrainingCenter({
    required this.name,
    this.abbreviation,
    this.companyName,
    this.taxCode,
    this.phoneNumber,
    this.email,
    this.district,
    this.address,
    this.centerType,
    this.subject,
    this.tenants
  });

  factory TrainingCenter.fromJson(Map<String, dynamic> json) => _$TrainingCenterFromJson(json);
  String name;
  String? abbreviation;
  String? companyName;
  String? taxCode;
  String? phoneNumber;
  String? email;
  String? district;
  String? address;
  CenterType? centerType;
  Subject? subject;
  List<Tenant>? tenants;
  Map<String, dynamic> toJson() => _$TrainingCenterToJson(this);
}

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class CenterType {
  CenterType({required this.name, required this.id});

  factory CenterType.fromJson(Map<String, dynamic> json) => _$CenterTypeFromJson(json);

  String name;
  String id;

  Map<String, dynamic> toJson() => _$CenterTypeToJson(this);
}
