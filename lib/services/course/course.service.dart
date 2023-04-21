import 'dart:io';

import 'package:ai_care/models/course/course.dart';
import 'package:ai_care/repositories/course/course.repository.dart';

class CourseService {
  Future<List<Course>> getCoursesHaveSameTrainingCenterWithStudent(String studentId, {Map<String, dynamic>? params}) async {
    final response = await CourseRepository.getCoursesHaveTrainingCenterWithStudent(studentId, params: params);
    return response.statusCode == HttpStatus.ok
        ? (response.data['data'] as List<dynamic>).map((e) => Course.fromJson(e as Map<String, dynamic>)).toList()
        : throw Exception(response);
  }
}
