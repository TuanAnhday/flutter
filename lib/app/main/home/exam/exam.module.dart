import 'package:ai_care/app/main/home/exam/exam.view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ExamModule extends Module {
  static String exam = '/';
  @override
  final List<Bind> binds = [];
  @override
  final List<ModularRoute> routes = [
    ChildRoute(exam, child: (context, args) => const ExamView()),
  ];

  // TODO: implement view
  Widget get view => const ExamView();
}
