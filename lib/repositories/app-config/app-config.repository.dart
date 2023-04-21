import '../../config/application.dart';

mixin AppConfigRepository {
  static Future<dynamic> config() {
    return Application.api.get('/api/application/config');
  }
}