import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/application.dart';
import '../../services/authentication/authentication.service.dart';
import '../../utils/exception.dart';

part 'login.state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._authenticationService) : super(const LoginInitial());

  final AuthenticationService _authenticationService;

  var rememberPassword = Application.sharePreference.hasKey('credentialData');

  void changeCheckbox(val) => rememberPassword = val as bool;

  Future<bool> login(Map<String, dynamic> data) async {
    final params = {
      'userName': data['user_name'],
      'password': data['password'],
    };
    try {
      emit(const Signing());
      final result = await _authenticationService.login(params);
      Application.sharePreference
        ..putString('accessToken', '${result.accessToken}')
        ..putString('userId', '${result.user?.id}');
      emit(const Signed());
      return true;
    } on NetworkException {
      emit(const Signed());
      return false;
    }
  }
}
