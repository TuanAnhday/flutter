import 'package:ai_care/models/class/class.dart';
import 'package:ai_care/models/exam/exam_detail.dart';
import 'package:ai_care/models/exam/exam_detail_student.dart';
import 'package:ai_care/services/class/class.service.dart';
import 'package:ai_care/services/exam-detail/exam-detail.service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../models/exam/exam.dart';

part 'exam.state.dart';

class ExamCubit extends Cubit<ExamState> {
  ExamCubit() : super(const ExamInitial());

  List<ExamDetailStudent> examDetailStudents = <ExamDetailStudent>[];
  List<ClassData> classes = <ClassData>[];
  final ClassService _classService = ClassService();
  final ExamDetailService _examDetailService = ExamDetailService();

  Future<void> getClassByStudentId(String studentId) async {
    emit(const ClassLoading());
    final data = await _classService.getClassByStudentId(studentId);
    classes.add(ClassData(className: 'Tất cả lớp học'));
    classes = [...classes,...data];
    // classes.add(Class(className: 'Kỳ thi khác'));
    emit(ClassLoaded(classes: classes));
  }

  Future<void> getExamDetailStudent(Map<String, dynamic> params) async {
    emit(const ExamDetailStudentLoading());
    final data = await _examDetailService.getExamDetailStudent(params);
    examDetailStudents = data;
    // log(examDetailStudents.map((e) => e.toJson()).toString());
    emit(ExamDetailStudentLoaded(examDetailStudents: examDetailStudents));
  }
}
