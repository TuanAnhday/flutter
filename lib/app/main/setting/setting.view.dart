import 'package:ai_care/app/app.module.dart';
import 'package:ai_care/app/components/dialog/dialog-confirm/dialog_confirm.dart';
import 'package:ai_care/config/application.dart';
import 'package:ai_care/resources/default.i18n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sizer/sizer.dart';

class SettingView extends StatefulWidget {
  const SettingView({Key? key}) : super(key: key);

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () => _logOut(context),
              child: const Text('logout'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _logOut(BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return DialogConfirm(
          maxHeight: 50.h,
          label: 'Are you sure to logout of this account?'.i18n,
          onPressOk: () {
            Application.sharePreference.clearAllExcept(['credentialData', 'listUser']);
            Navigator.pop(context);
            Modular.to.navigate(AppModule.openingPage);
          },
        );
      },
    );
  }
}
