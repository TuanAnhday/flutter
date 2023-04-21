import 'package:ai_care/app/main/home/finance/finance.view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FinanceModule extends Module {

  static String finance = '/';
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(finance, child: (context, args) => const FinanceView()),
  ];

  // TODO: implement view
  Widget get view => const FinanceView();
}
