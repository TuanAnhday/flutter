import 'dart:io';

import 'package:ai_care/models/lesson-info/lesson_info.dart';
import 'package:ai_care/repositories/lesson-info/lesson-info.repository.dart';

import '../../../utils/exception.dart';

class LessonInfoService {
  Future<List<LessonInfo>> getByClassIdAndStudentId(Map<String, dynamic> params) async {
    final response = await LessonInfoRepository.getByClassIdAndStudentId(params);
    return response.statusCode == HttpStatus.ok
        ? (response.data['data'] as List).map((e) => LessonInfo.fromJson(e as Map<String, dynamic>)).toList()
        : throw NetworkException(message: {'message': response.data['message']});
  }
}
