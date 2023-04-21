import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/auth/login/login_data.dart';
import '../login/welcome-page.view.dart';

class OpeningPage extends StatefulWidget {
  const OpeningPage({super.key});

  @override
  State<OpeningPage> createState() => _OpeningPageState();
}

class _OpeningPageState extends State<OpeningPage> {

  @override
  Widget build(BuildContext context) {
    return WelcomePage(account: UserAccount(), isBack: false);
  }
}
