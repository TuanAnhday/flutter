import 'dart:async';
import 'package:ai_care/app/main/nav-bar.module.dart';
import 'package:ai_care/resources/cache_data.dart';
import 'package:ai_care/services/app-config/app-config.service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sizer/sizer.dart';
import '../../config/application.dart';
import '../../models/app-config/app_config.dart';
import '../app.module.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final AppConfigService _appConfigService = AppConfigService();

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), startTime);
  }

  Future<Timer> startTime() async {
    return Timer(const Duration(milliseconds: 1500), navigationPage);
  }

  Future<void> navigationPage() async {
    if (Application.sharePreference.hasKey('accessToken')) {
      final AppConfig data = await _appConfigService.getConfig();
      CacheData.setAppConfig(data);
      Application.sharePreference.hasKey('studentId') ? Modular.to.navigate(AppModule.main + NavBarModule.navbar) : Modular.to.navigate(AppModule.main);
    } else {
      Modular.to.navigate(AppModule.openingPage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Center(child: Image(image: AssetImage('assets/images/splash/splash.png'))),
          Container(
            margin: EdgeInsets.only(top: 30.sp),
            child: const Center(
              child: Text(
                'Chào mừng đến với AICare',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, fontStyle: FontStyle.italic, color: Color(0xff1B6086)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
