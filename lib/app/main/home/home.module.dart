import 'package:ai_care/app/main/home/finance/finance.module.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home.view.dart';

class HomeModule extends WidgetModule {
  HomeModule({super.key});

  static String finance = '/finance';

  @override
  List<Bind> get binds => [];

  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const HomeView()),
        ModuleRoute(finance, module: FinanceModule()),
      ];

  @override
  Widget get view => const HomeView();
}
