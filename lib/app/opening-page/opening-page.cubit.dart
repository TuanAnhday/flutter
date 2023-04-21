import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/application.dart';
import '../../models/auth/login/login_data.dart';
import '../../services/authentication/authentication.service.dart';
import '../../utils/exception.dart';

part 'opening-page.state.dart';

class OpeningPageCubit extends Cubit<OpeningPageState> {
  // final UserService _userService;

  OpeningPageCubit(this._authenticationService) : super(const OpeningPageInitial());
  final AuthenticationService _authenticationService;

  Future<bool> login(UserAccount data) async {
    final params = {
      'userName': data.userName,
      'password': data.passWord,
    };
    try {
      emit(const Signing());
      final result = await _authenticationService.login(params);
      Application.sharePreference
        ..putString('accessToken', '${result.accessToken}')
        ..putString('userId', '${result.user?.id}');

      await fetchConfigData();

      // var dvt = await PushNotificationsManager.firebaseMessaging.getToken();
      // print(dvt);
      // await _authenticationService.sendDeviceToken([dvt.toString()]);
      // Application.sharePreference.putString('deviceToken', dvt.toString());
      emit(const Signed());
      return true;
    } on NetworkException catch (e) {
      final message = e.message['message'] != null ? "${e.message["message"]}" : '';
      emit(OpeningPageError(message));
      emit(const Signed());
      return false;
    }
  }

  Future<bool> fetchConfigData() async {
    try {
      // var val = await Future.wait([_userService.fetchUserData(), _authenticationService.fetchExerciseData()]);
      // Application.user = val.first as UserData;
      // CacheData.setHomeData(val.last as HomeData);
      return true;
    } on NetworkException catch (_) {
      return false;
    }
  }
}
