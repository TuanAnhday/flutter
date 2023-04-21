import 'dart:io';

import 'package:ai_care/models/course-plan/course_plan.dart';
import 'package:ai_care/repositories/course-plan/course-plan.repository.dart';

class CoursePlanService {
  Future<CoursePlan> getByCourseId(String courseId) async {
    final response = await CoursePlanRepository.getByCourseId(courseId);
    return response.statusCode == HttpStatus.ok
        ? CoursePlan.fromJson(response.data as Map<String, dynamic>)
        : throw Exception(response);
  }
}
