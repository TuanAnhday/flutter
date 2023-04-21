import 'package:json_annotation/json_annotation.dart';

part 'admissions_channel.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class AdmissionsChannel {
  AdmissionsChannel({required this.name, this.description});

  factory AdmissionsChannel.fromJson(Map<String, dynamic> json) => _$AdmissionsChannelFromJson(json);

  String name;
  String? description;

  Map<String, dynamic> toJson() => _$AdmissionsChannelToJson(this);
}
