import '../../config/application.dart';

mixin LessonInfoRepository {
  static Future<dynamic> getByClassIdAndStudentId(Map<String, dynamic> params) {
    return Application.api.get('api/lesson-infos/GetByClassIdAndStudentId', params);
  }
}
