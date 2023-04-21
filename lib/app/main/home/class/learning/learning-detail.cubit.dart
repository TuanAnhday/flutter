import 'dart:developer';

import 'package:ai_care/models/student/student.dart';
import 'package:ai_care/services/student/student.service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'learning-detail.state.dart';

class LearningDetailCubit extends Cubit<LearningDetailState> {
  LearningDetailCubit() : super(const LearningDetailInit());

  final StudentService _studentService = StudentService();
  late Student student;

  Future<void> getStudent(String studentId) async {
    emit(const StudentLoading());
    final data = await _studentService.getById(studentId);
    student = data;
    emit(StudentLoaded(student: student));
  }
}
