import 'package:ai_care/app/main/home/class/class.view.dart';
import 'package:ai_care/app/main/home/class/learning/learning-detail.view.dart';
import 'package:ai_care/models/lesson-info/lesson_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ClassModule extends Module {
  static String classPath = '/';
  static String learningDetail = '/learning-detail';
  @override
  final List<Bind> binds = [];
  @override
  final List<ModularRoute> routes = [
    ChildRoute(classPath, child: (context, args) => const ClassView()),
    ChildRoute(learningDetail, child: (context, args) => LearningDetailView(lessonInfo: args.data as LessonInfo))
  ];

  // TODO: implement view
  Widget get view => const ClassView();
}
