import 'dart:io';

import 'package:ai_care/models/class/learning_class.dart';
import 'package:ai_care/models/student/student.dart';
import 'package:ai_care/repositories/student/student.repository.dart';
import 'package:ai_care/utils/exception.dart';

class StudentService {
  Future<List<Student>> getStudentByParentId(Map<String, dynamic> params) async {
    final response = await StudentRepository.getByParentId(params);
    return response.statusCode == HttpStatus.ok
        ? (response.data['data'] as List).map((e) => Student.fromJson(e as Map<String, dynamic>)).toList()
        : throw NetworkException();
  }

  Future<List<Student>> getAllByParent(Map<String, dynamic> params) async {
    final response = await StudentRepository.getAllByParent(params);
    return response.statusCode == HttpStatus.ok
        ? (response.data['data'] as List<dynamic>).map((e) => Student.fromJson(e as Map<String, dynamic>)).toList()
        : throw NetworkException(message: {'message': response.toString()});
  }

  Future<LearningClass> getLearning(Map<String, dynamic> params) async {
    final response = await StudentRepository.getLearning(params);
    return response.statusCode == HttpStatus.ok
        ? LearningClass.fromJson(response.data['data'] as Map<String, dynamic>)
        : throw NetworkException(message: {'message': response.data['message'].toString()});
  }

  Future<Student> getById(String studentId) async {
    final response = await StudentRepository.getById(studentId);
    return response.statusCode == HttpStatus.ok
        ? Student.fromJson(response.data['data'] as Map<String, dynamic>)
        : throw NetworkException(message: {'message': response.data['message'].toString()});
  }
}
