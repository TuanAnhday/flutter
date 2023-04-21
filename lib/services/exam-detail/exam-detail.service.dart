import 'dart:io';

import 'package:ai_care/models/exam/exam_detail_student.dart';
import 'package:ai_care/repositories/exam-detail/exam-detail.repository.dart';
import 'package:ai_care/utils/exception.dart';

class ExamDetailService {
  Future<List<ExamDetailStudent>> getExamDetailStudent(Map<String, dynamic> params) async {
    final response = await ExamDetailRepository.getExamDetailStudent(params);
    return response.statusCode == HttpStatus.ok
        ? (response.data['data'] as List).map((e) => ExamDetailStudent.fromJson(e as Map<String, dynamic>)).toList()
        : throw NetworkException(message: {'message': response.data['message']});
  }
}
