import 'package:ai_care/app/main/home/Report/Report.view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ReportModule extends Module {
  static String report = '/';

  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(report, child: (context, args) => const ReportView()),
  ];

  // TODO: implement view
  Widget get view => const ReportView();
}
