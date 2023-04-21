// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginData _$LoginDataFromJson(Map<String, dynamic> json) => LoginData(
      user: json['user'] == null
          ? null
          : UserData.fromJson(json['user'] as Map<String, dynamic>),
      accessToken: json['accessToken'] as String?,
    );

Map<String, dynamic> _$LoginDataToJson(LoginData instance) => <String, dynamic>{
      'user': instance.user?.toJson(),
      'accessToken': instance.accessToken,
    };

UserLocal _$UserLocalFromJson(Map<String, dynamic> json) => UserLocal(
      listAccount: (json['listAccount'] as List<dynamic>?)
          ?.map((e) => UserAccount.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserLocalToJson(UserLocal instance) => <String, dynamic>{
      'listAccount': instance.listAccount?.map((e) => e.toJson()).toList(),
    };

UserAccount _$UserAccountFromJson(Map<String, dynamic> json) => UserAccount(
      name: json['name'] as String?,
      imageUrl: json['imageUrl'] as String?,
      passWord: json['passWord'] as String?,
      userName: json['userName'] as String?,
    );

Map<String, dynamic> _$UserAccountToJson(UserAccount instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'passWord': instance.passWord,
      'imageUrl': instance.imageUrl,
      'name': instance.name,
    };
