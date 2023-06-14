import 'dart:io';
import '../../models/auth/login/login_data.dart';
import '../../repositories/authentication/authentication.repository.dart';
import '../../utils/exception.dart';

class AuthenticationService {
  Future<LoginData> login(Map<String, dynamic> params) async {
    final response = await AuthenticationRepository.login(params);
    print(response);
    return response.statusCode == HttpStatus.ok
        ? LoginData.fromJson(response.data as Map<String, dynamic>)
        : throw NetworkException(message: {'message': response});
  }
}
