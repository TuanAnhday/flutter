import 'package:ai_care/config/application.dart';

mixin CoursePlanRepository {
  static Future<dynamic> getByCourseId(String courseId) {
    return Application.api.get('api/course-plans/courses/$courseId');
  }
}
