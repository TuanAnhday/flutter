import 'package:json_annotation/json_annotation.dart';

part 'tenant.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class Tenant {
  Tenant({
    required this.name,
    required this.phoneNumber,
    required this.email,
    required this.address,
    required this.trainingCenterId,
    required this.isRoot,
    required this.id,
  });

  factory Tenant.fromJson(Map<String, dynamic> json) => _$TenantFromJson(json);

  String name;
  String phoneNumber;
  String email;
  String address;
  String trainingCenterId;
  bool isRoot;
  String id;

  Map<String, dynamic> toJson() => _$TenantToJson(this);
}
