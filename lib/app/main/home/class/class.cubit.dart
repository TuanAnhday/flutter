import 'package:ai_care/models/class/learning_class.dart';
import 'package:ai_care/models/lesson-info/lesson_info.dart';
import 'package:ai_care/services/class/class.service.dart';
import 'package:ai_care/services/lesson-info/service/lesson-info.service.dart';
import 'package:ai_care/services/student/student.service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../models/class/class.dart';

part 'class.state.dart';

class ClassCubit extends Cubit<ClassState> {
  ClassCubit() : super(const ClassInitial());
  List<ClassData> classes = <ClassData>[];
  List<LessonInfo> lessonInfos = <LessonInfo>[];
  final ClassService _classService = ClassService();
  final LessonInfoService _lessonInfoService = LessonInfoService();
  final StudentService _studentService = StudentService();
  LearningClass learningClass = LearningClass();
  int present = 0;
  ClassTab type = ClassTab.attendance;

  Future<void> getClassByStudentId(String studentId) async {
    emit(const ClassLoading());
    final data = await _classService.getClassByStudentId(studentId);
    classes = data;
    emit(ClassLoaded(classes: classes));
  }

  Future<void> getLessonInfoByClassIdAndStudentId(Map<String, dynamic> params) async {
    emit(const LessonInfoLoading());
    final data = await _lessonInfoService.getByClassIdAndStudentId(params);
    lessonInfos = data;
    emit(LessonInfoLoaded(lessonInfos: lessonInfos));
  }

  void getPresent() {
    present = 0;
    final temp = lessonInfos.map((element) => element.isPresent == true ? 1 : 0);
    if (temp.isNotEmpty) {
      present = temp.reduce((value, element) => value + element);
    }
  }

  Future<void> getLearning(Map<String, dynamic> params) async {
    emit(const LearningLoading());
    final data = await _studentService.getLearning(params);
    learningClass = data;
    emit(LearningLoaded(learningClass: learningClass));
  }
}

enum ClassTab { attendance, learning }
