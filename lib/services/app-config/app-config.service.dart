import 'dart:io';
import 'package:ai_care/models/app-config/app_config.dart';
import 'package:ai_care/repositories/app-config/app-config.repository.dart';

class AppConfigService {
  Future<AppConfig> getConfig() async {
    final response = await AppConfigRepository.config();
    return response.statusCode == HttpStatus.ok ? AppConfig.fromJson(response.data as Map<String, dynamic>) : throw Exception();
  }
}
