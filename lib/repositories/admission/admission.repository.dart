import 'package:ai_care/config/application.dart';

mixin AdmissionRepository {
  static Future<dynamic> getByStudentId(String studentId) {
    return Application.api.get('api/admissions/student/$studentId');
  }
}
