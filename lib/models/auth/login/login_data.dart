import 'package:json_annotation/json_annotation.dart';

import '../user/user.dart';
part 'login_data.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class LoginData {
  LoginData({this.user, this.accessToken});

  factory LoginData.fromJson(Map<String, dynamic> json) => _$LoginDataFromJson(json);
  UserData? user;
  String? accessToken;

  Map<String, dynamic> toJson() => _$LoginDataToJson(this);
}

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class UserLocal {

  UserLocal({this.listAccount});

  factory UserLocal.fromJson(Map<String, dynamic> json) => _$UserLocalFromJson(json);
  List<UserAccount>? listAccount = [];

  Map<String, dynamic> toJson() => _$UserLocalToJson(this);
}
@JsonSerializable(includeIfNull: true, explicitToJson: true)
class UserAccount {

  UserAccount({this.name, this.imageUrl, this.passWord, this.userName});
  factory UserAccount.fromJson(Map<String, dynamic> json) => _$UserAccountFromJson(json);
  String? userName;
  String? passWord;
  String? imageUrl;
  String? name;

  Map<String, dynamic> toJson() => _$UserAccountToJson(this);
}