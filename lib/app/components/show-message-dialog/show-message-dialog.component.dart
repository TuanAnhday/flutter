import 'package:flutter/material.dart';
import 'package:i18n_extension/default.i18n.dart';
import 'package:sizer/sizer.dart';

import '../../../themes/style.dart';

Future<dynamic> createDialogShowMessageAndAction({
  required BuildContext context,
  required String title,
  double? top,
  String? message,
  String? titleLeftButton,
  String? titleRightButton,
  void Function(BuildContext context)? leftAction,
  void Function(BuildContext context)? rightAction,
  bool barrierDismissible = true,
}) => showDialog(
      barrierDismissible: barrierDismissible,
      context: context,
      builder: (context) => Dialog(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: Text(title,
                          style: Theme.of(context).textTheme.bodyText1!.copyWith(color: AppColor.accentColor, fontWeight: FontWeight.w700)),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: Text(message ?? '', style: Theme.of(context).textTheme.bodyText1),
                    ),
                    Row(
                      children: [
                        const Spacer(),
                        if (leftAction != null && titleLeftButton != null)
                          GestureDetector(
                            onTap: () => leftAction.call(context),
                            behavior: HitTestBehavior.translucent,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(titleLeftButton, style: Theme.of(context).textTheme.bodyText1!.copyWith(color: AppColor.accentColor)),
                            ),
                          ),
                        if (rightAction != null && titleRightButton != null)
                          GestureDetector(
                            onTap: () => rightAction.call(context),
                            behavior: HitTestBehavior.translucent,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(titleRightButton, style: Theme.of(context).textTheme.bodyText1!.copyWith(color: AppColor.accentColor)),
                            ),
                          ),
                        SizedBox(width: 1.w)
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ));

Future<void> showAppDialog(BuildContext context, {required String title, required VoidCallback submit}) async {
  return showDialog<void>(
    context: context,
    builder: (_context) => AlertDialog(
      content: SingleChildScrollView(
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(color: AppColor.textColor, fontWeight: FontWeight.w500),
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text(
            'cancel'.i18n,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(color: const Color(0xFFBBBBBB), fontWeight: FontWeight.w500),
          ),
          onPressed: () => Navigator.pop(_context),
        ),
        TextButton(
          child: Text('OK', style: Theme.of(context).textTheme.bodyText1!.copyWith(color: const Color(0xFF019BF2), fontWeight: FontWeight.w500)),
          onPressed: () {
            submit();
            Navigator.pop(_context);
          },
        ),
      ],
    ),
  );
}
