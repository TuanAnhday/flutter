import 'package:ai_care/config/application.dart';

mixin CourseRepository {
  static Future<dynamic> getCoursesHaveTrainingCenterWithStudent(String studentId, {Map<String, dynamic>? params}) {
    return Application.api.get('api/courses/student/$studentId', params);
  }
}
