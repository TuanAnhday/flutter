import 'package:ai_care/config/application.dart';

mixin ExamDetailRepository {
  static Future<dynamic> getExamDetailStudent(Map<String, dynamic> params) {
    return Application.api.get('api/exam-details/student', params);
  }
}
