import 'package:ai_care/app/main/home/course/course-detail/course-detail.view.dart';
import 'package:ai_care/app/main/home/course/course.view.dart';
import 'package:ai_care/models/course/course.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CourseModule extends Module {
  static String course = '/';
  static String courseDetail = '/course-detail';

  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(course, child: (context, args) => const CourseView()),
    ChildRoute(courseDetail, child: (context, args) => CourseDetailView(course: args.data as Course))
  ];

  // TODO: implement view
  Widget get view => const CourseView();
}
