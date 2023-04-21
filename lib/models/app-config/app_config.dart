import 'package:ai_care/models/auth/user/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'app_config.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class AppConfig {
  AppConfig({this.user, this.permissions});

  factory AppConfig.fromJson(Map<String, dynamic> json) => _$AppConfigFromJson(json);

  UserData? user;
  List<String>? permissions;

  Map<String, dynamic> toJson() => _$AppConfigToJson(this);
}
