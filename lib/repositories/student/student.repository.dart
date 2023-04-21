import 'package:ai_care/config/application.dart';

mixin StudentRepository {
  static Future<dynamic> getByParentId(Map<String, dynamic> params) {
    return Application.api.get('/api/students/getByParentId', params);
  }

  static Future<dynamic> getAllByParent(Map<String, dynamic> params) {
    return Application.api.get('/api/students/getAllByParent', params);
  }

  static Future<dynamic> getLearning(Map<String, dynamic> params) {
    return Application.api.get('/api/students/learning', params);
  }

  static Future<dynamic> getById(String studentId) {
    return Application.api.get('/api/students/$studentId');
  }
}
