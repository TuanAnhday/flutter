import '../../config/application.dart';

mixin AuthenticationRepository {
  static Future<dynamic> login(Map<String, dynamic> params) {
    return Application.api.post('/api/users/login', params);
    // return Application.api.get('/users');
  }
}
