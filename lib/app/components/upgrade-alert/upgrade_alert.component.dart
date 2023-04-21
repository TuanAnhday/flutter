import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:upgrader/upgrader.dart';
import 'package:url_launcher/url_launcher_string.dart';

class UpgradeAlertComponent extends StatelessWidget {

  const UpgradeAlertComponent({required this.child, Key? key}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return UpgradeAlert(
      upgrader: Upgrader(
        debugLogging: false,
        shouldPopScope: () => true,
        showIgnore: false,
        // debugDisplayOnce: true,
        canDismissDialog: true,
        onUpdate: () {
          if (defaultTargetPlatform == TargetPlatform.android) {
            launchUrlString(dotenv.env['GOOGLE_PLAY_URL']!);
          }
          if (defaultTargetPlatform == TargetPlatform.iOS) {
            launchUrlString(dotenv.env['APPSTORE_URL']!);
          }
          return true;
        },
        showReleaseNotes: false,
      ),
      child: child,
    );
  }
}
