import 'package:ai_care/models/app-config/app_config.dart';
import 'package:ai_care/models/student/student.dart';

class CacheData {
  CacheData._();

  static late AppConfig _config;

  static AppConfig get config => _config;

  static Future<void> setAppConfig(AppConfig config) async => _config = config;

  static late Student _student;

  static Student get student => _student;

  static Future<void> setStudent(Student student) async => _student = student;
}
