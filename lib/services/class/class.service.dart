import 'dart:io';

import 'package:ai_care/models/class/class.dart';
import 'package:ai_care/repositories/class/class.repository.dart';
import 'package:ai_care/utils/exception.dart';

class ClassService {
  Future<List<ClassData>> getClassByStudentId(String studentId, {Map<String, dynamic>? params}) async {
    final response = await ClassRepository.getClassByStudentId(studentId, params: params);
    return response.statusCode == HttpStatus.ok
        ? (response.data['data'] as List<dynamic>).map((e) => ClassData.fromJson(e as Map<String, dynamic>)).toList()
        : throw NetworkException(message: {'message': response});
  }


}
