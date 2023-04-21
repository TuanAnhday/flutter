import 'package:ai_care/app/main/setting/setting.module.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:i18n_extension/default.i18n.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sizer/sizer.dart';

import '../components/show-message-dialog/show-message-dialog.component.dart';
import '../components/upgrade-alert/upgrade_alert.component.dart';
import 'home/home.module.dart';

class AppNavBar extends StatefulWidget {
  const AppNavBar({this.index, Key? key}) : super(key: key);
  final int? index;

  @override
  AppNavBarState createState() => AppNavBarState();
}

class AppNavBarState extends State<AppNavBar> {
  final CupertinoTabController _controller = CupertinoTabController();

  @override
  void initState() {
    initData();
    super.initState();
  }

  void initData() {
    _controller.index = 0;
    if (widget.index != null) {
      _controller.index = widget.index!;
    }
  }

  final _data = [
    {
      'name': 'Home',
      'icon': 'assets/images/home/navbar/home.svg',
      'component': HomeModule(),
    },
    {
      'name': 'Newsfeed',
      'icon': 'assets/images/home/navbar/newsfeed.svg',
      'component': Container(),
    },
    {
      'name': 'Setting',
      'icon': 'assets/images/home/navbar/setting.svg',
      'component': SettingModule(),
    }
  ];

  Future<void> askPermission() async {
    final bool headphonesConnected = await Permission.microphone.isGranted;
    if (!headphonesConnected) {
      Future.delayed(const Duration(seconds: 1), showAskForPermissionDialog);
    }
  }

  void showAskForPermissionDialog() => createDialogShowMessageAndAction(
        context: context,
        top: 50.h,
        message:
            "hoclieu.vn uses microphone for recording user's voice for some type of questions. Please allow us to use microphone's permission".i18n,
        title: 'Permission Asking'.i18n,
        titleRightButton: 'Next'.i18n,
        rightAction: checkForHeadphoneConnection,
        titleLeftButton: 'Maybe later'.i18n,
        leftAction: Navigator.pop,
      );

  Future<void> checkForHeadphoneConnection(BuildContext context) async {
    final bool headphonesConnected = await Permission.microphone.request().isGranted;

    if (!headphonesConnected) {
      createDialogShowMessageAndAction(
        context: context,
        top: 50.h,
        title: 'Please plugin headphone for better recorder!'.i18n,
        titleRightButton: 'Close'.i18n,
        // ignore: use_build_context_synchronously
        rightAction: Navigator.of(context).pop,
      );
    }
    // ignore: use_build_context_synchronously
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: UpgradeAlertComponent(
        // child: BlocListener<ProfileNewCubit, ProfileNewState>(
        //   listener: (context, state) {
        //     if (state is ProfileNewNotUpdated) {
        //       Modular.to.pushNamed(AppModule.home + NavBarModule.updateProfile);
        //     }
        //   },
        //   bloc: Modular.get<ProfileNewCubit>(),
        child: CupertinoPageScaffold(
          child: CupertinoTabScaffold(
            tabBuilder: (context, index) => WillPopScope(
              onWillPop: () async {
                if (_controller.index != 0) {
                  _controller.index = 0;
                  return false;
                } else {
                  return true;
                }
              },
              child: _data[index]['component'] as Widget,
            ),
            controller: _controller,
            tabBar: CupertinoTabBar(
              onTap: (i) => _controller.index = i,
              items: _data
                  .map(
                    (e) => BottomNavigationBarItem(
                      icon: _iconBottomBar(e, false),
                      activeIcon: _iconBottomBar(e, true),
                      label: e['name'] as String,
                    ),
                  )
                  .toList(),
              backgroundColor: Colors.white,
              border: const Border(),
              activeColor: const Color(0xff00548B),
            ),
          ),
        ),
      ),
    );
  }

  Widget _iconBottomBar(Map<String, dynamic> data, bool isActive) {
    return SvgPicture.asset(data['icon'] as String, color: isActive ? const Color(0xff00548B) : const Color(0xffCCCCCC));
  }
}
