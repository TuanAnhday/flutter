import 'package:ai_care/models/class/class.dart';
import 'package:ai_care/models/course/course.dart';
import 'package:ai_care/services/admission/admission.service.dart';
import 'package:ai_care/services/course/course.service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../models/admission/admission.dart';

part 'course.state.dart';

class CourseCubit extends Cubit<CourseState> {
  CourseCubit() : super(const CourseInitial());
  final CourseService _courseService = CourseService();
  final AdmissionService _admissionService = AdmissionService();
  List<Course> courses = <Course>[];
  List<Admission> admissions = <Admission>[];
  Future<void> getCoursesHaveTrainingCenterWithStudent(String studentId, {Map<String, dynamic>? params}) async {
    emit(const CourseLoading());
    final data = await _courseService.getCoursesHaveSameTrainingCenterWithStudent(studentId, params: params);
    courses = data;
    emit(CourseLoaded(courses: courses));
  }

  Future<void> getAdmissionByStudentId(String studentId) async {
    emit(const AdmissionLoading());
    final data =  await _admissionService.getByStudentId(studentId);
    admissions = data;
    emit(AdmissionLoaded(admissions: admissions));
  }
}
