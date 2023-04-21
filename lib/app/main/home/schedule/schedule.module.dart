import 'package:ai_care/app/main/home/schedule/schedule.view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ScheduleModule extends Module {

  static String schedule = '/';
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(schedule, child: (context, args) => const ScheduleView()),
  ];

  // TODO: implement view
  Widget get view => const ScheduleView();
}
