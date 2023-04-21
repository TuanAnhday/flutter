import 'package:asuka/asuka.dart';
import 'package:device_preview/device_preview.dart' hide DeviceType;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:i18n_extension/i18n_widget.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../config/application.dart';
import '../config/locale.dart';
import '../themes/style.dart';
import '../utils/api.dart';
import '../utils/custom_toast.dart';
import '../utils/logger.dart';

final isWebPC = kIsWeb && defaultTargetPlatform != TargetPlatform.iOS && defaultTargetPlatform != TargetPlatform.android;

class AppWidget extends StatelessWidget {
  AppWidget({super.key}) {
    Application.api = API();
    Application.toast = Toastify();
    Application.logger = AppLogger();
    Intl.defaultLocale = 'vi_vn';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Container(
        alignment: Alignment.center,
        color: Colors.white,
        child: SizedBox(
          width: isWebPC ? 450 : null,
          child: I18n(
            initialLocale: const Locale('vi', 'VN'),
            child: Sizer(
              builder: (context, orientation, deviceType) {
                (deviceType == DeviceType.tablet)
                    ? SystemChrome.setPreferredOrientations(DeviceOrientation.values)
                    : SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
                return MaterialApp.router(
                  localizationsDelegates: const [
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: AppLocale.locales.values,
                  locale: const Locale('vi', 'VN'),
                  theme: ThemeData(
                    pageTransitionsTheme: const PageTransitionsTheme(
                        builders: {
                          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
                          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
                        }
                    ),
                    visualDensity: VisualDensity.adaptivePlatformDensity,
                    canvasColor: Colors.white,
                    fontFamily: 'Montserrat',
                    unselectedWidgetColor: const Color(0xFFADBBC2),
                    textTheme: const TextTheme(
                      bodyText1: TextStyle(fontFamilyFallback: ['Montserrat'], fontWeight: FontWeight.w500, height: 1.4,color: AppColor.defaultColor),
                    ),
                    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: AppColor.accentColor),
                  ),
                  debugShowCheckedModeBanner: false,
                  // builder: EasyLoading.init(
                  //   builder: (context, child) => MediaQuery(
                  //     data: MediaQuery.of(context).copyWith(textScaleFactor: scaleTextBaseOnDeviceType(deviceType)),
                  //     child: DevicePreview.appBuilder(context, asuka.builder(context, child)),
                  //   ),
                  // ),
                  builder: EasyLoading.init(
                    builder: (context, child) => DevicePreview.appBuilder(context, Asuka.builder(context, child)),
                  ),
                  routeInformationParser: Modular.routeInformationParser,
                  routerDelegate: Modular.routerDelegate,
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  double scaleTextBaseOnDeviceType(DeviceType deviceType) {
    switch (deviceType) {
      case DeviceType.mobile:
        return 1.2;
      case DeviceType.tablet:
        return 1.2;
      case DeviceType.web:
      case DeviceType.mac:
      case DeviceType.windows:
      case DeviceType.linux:
      case DeviceType.fuchsia:
        return 1;
    }
  }
}
