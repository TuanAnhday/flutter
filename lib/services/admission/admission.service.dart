import 'dart:io';

import 'package:ai_care/models/admission/admission.dart';
import 'package:ai_care/repositories/admission/admission.repository.dart';
import 'package:ai_care/utils/exception.dart';

class AdmissionService {
  Future<List<Admission>> getByStudentId(String studentId) async {
    final response = await AdmissionRepository.getByStudentId(studentId);
    return response.statusCode == HttpStatus.ok
        ? (response.data['data'] as List).map((e) => Admission.fromJson(e as Map<String, dynamic>)).toList()
        : throw NetworkException(message: {'message': response.data['message']});
  }
}
