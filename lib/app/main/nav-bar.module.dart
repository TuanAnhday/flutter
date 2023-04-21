import 'package:ai_care/app/main/choose-student/choose-student.view.dart';
import 'package:ai_care/app/main/home/class/class.module.dart';
import 'package:ai_care/app/main/home/course/course.module.dart';
import 'package:ai_care/app/main/home/exam/exam.module.dart';
import 'package:ai_care/app/main/home/finance/finance.module.dart';
import 'package:ai_care/app/main/home/home.module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home/report/report.module.dart';
import 'home/schedule/schedule.module.dart';
import 'nav-bar.view.dart';

class NavBarModule extends Module {
  static String chooseStudent = '/';
  static String navbar = '/navbar';
  static String home = '/home';
  static String setting = '/setting';
  static String finance = '/finance';
  static String schedule = '/schedule';
  static String exam = '/exam';
  static String classPath = '/class';
  static String course = '/course';
  static String report = '/report';
  @override
  final List<Bind> binds = [];

  // Provide all the routes for your module
  @override
  final List<ModularRoute> routes = [
    ChildRoute(chooseStudent, child: (context, args) => const ChooseStudentView()),
    ChildRoute(navbar, child: (context, args) => const AppNavBar(index: 0)),
    ModuleRoute(finance, module: FinanceModule()),
    ModuleRoute(schedule, module: ScheduleModule()),
    ModuleRoute(exam, module: ExamModule()),
    ModuleRoute(classPath, module: ClassModule()),
    ModuleRoute(course, module: CourseModule()),
    ModuleRoute(report, module: ReportModule()),
    ChildRoute(home, child: (context, args) => HomeModule())
  ];
}
