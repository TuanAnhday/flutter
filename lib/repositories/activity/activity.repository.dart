import '../../config/application.dart';

mixin ActivityRepository {
  static Future<dynamic> getByClassAndDate(Map<String, dynamic> params) {
    return Application.api.get('/api/activities/classes',params);
  }
  static Future<dynamic> getByClassId(String classId) {
    return Application.api.get('/api/activities/no-pagination/$classId');
  }
}