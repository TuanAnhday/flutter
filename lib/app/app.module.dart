import 'package:ai_care/app/main/nav-bar.module.dart';
import 'package:ai_care/app/splash-screen/splash-screen.view.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../services/authentication/authentication.service.dart';
import 'login/login.cubit.dart';
import 'opening-page/opening-page.view.dart';

class AppModule extends Module {
  static String splashScreen = '/';
  static String main = '/main';
  static String login = '/login/';
  static String openingPage = '/openingPage';

  @override
  final List<Bind> binds = [Bind.lazySingleton((i) => LoginCubit(AuthenticationService()))];

  // Provide all the routes for your module
  @override
  final List<ModularRoute> routes = [
    ModuleRoute(main, module: NavBarModule(), transition: TransitionType.scale),
    ChildRoute(splashScreen, child: (context, args) => const SplashScreen(), transition: TransitionType.scale),
    ChildRoute(openingPage, child: (context, args) => const OpeningPage(), transition: TransitionType.scale),
  ];
}
