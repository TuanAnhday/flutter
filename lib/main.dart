import 'package:ai_care/utils/shared_preferences.dart';
import 'package:ai_care/utils/timeago_helper.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app/app.module.dart';
import 'app/app.view.dart';
import 'config/application.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarDividerColor: Colors.transparent,
    ),
  );

  final res = await Future.wait([
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]),
    dotenv.load(),
    SpUtil.getInstance(),
  ]);
  TimeAgoWrapper.init();
  Application.sharePreference = res.last as SpUtil;

  Bloc.observer = AppBlocObserver();
  runApp(DevicePreview(
    enabled: dotenv.env['DEVICEPREVIEW'] == 'true',
    builder: (context) => ModularApp(module: AppModule(), child: AppWidget()),
  ));
}

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (bloc is Bloc) {
      Application.logger.infoLog(change);
    }
  }
}
