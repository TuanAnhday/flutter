import 'package:ai_care/config/application.dart';

mixin ClassRepository {
  static Future<dynamic> getClassByStudentId(String studentId, {Map<String, dynamic>? params}) {
    return Application.api.get('api/classes/class-of-student/$studentId', params);
  }
}
