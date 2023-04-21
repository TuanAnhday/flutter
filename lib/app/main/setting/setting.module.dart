import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'setting.view.dart';

class SettingModule extends WidgetModule {
  SettingModule({super.key});

  @override
  List<Bind> get binds => [];

  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => const SettingView()),
  ];

  @override
  Widget get view => const SettingView();
}
