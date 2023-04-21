import 'package:ai_care/resources/default.i18n.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../utils/responsive.dart';
import 'custom_button.dart';

class DialogConfirm extends StatelessWidget {
  const DialogConfirm(
      {required this.maxHeight,
      required this.label,
      this.onPressCancel,
      this.onPressOk,
      this.radius,
      this.horizontalPadding,
      this.verticalPadding,
      this.labelText,
      Key? key,
      this.backgroundColor,
      this.elevation,
      this.spaceButton,
      this.width,
      this.height,
      this.cancelButtonName,
      this.okButtonName,
      this.contentWidget,
      this.customButtonCancel,
      this.customButtonOk})
      : super(key: key);

  final double? elevation;
  final double? spaceButton;
  final Color? backgroundColor;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double maxHeight;
  final double? radius;
  final String label;
  final Widget? labelText;
  final double? width;
  final double? height;
  final Widget? contentWidget;
  final String? cancelButtonName;
  final String? okButtonName;
  final Function()? onPressCancel;
  final Function()? onPressOk;
  final CustomButtonNew? customButtonCancel;
  final CustomButtonNew? customButtonOk;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: elevation ?? 0,
      // insetPadding: EdgeInsets.symmetric(horizontal: Responsive.isMobile ? 16 : 30),
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius ?? 8),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius ?? 8),
        child: Container(
          constraints: BoxConstraints(
            maxWidth: 100.w - 32,
            maxHeight: maxHeight,
          ),
          child: IntrinsicHeight(
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 2.5.h, horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: labelText ??
                          Text(
                            label,
                            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                  color: const Color(0xff2F4D87),
                                  // textBaseline: TextBaseline.alphabetic,
                                  fontSize: Responsive.isMobile ? 16 : 16,
                                  fontWeight: FontWeight.w500,
                                ),
                            textAlign: TextAlign.center,
                          ),
                    ),
                    SizedBox(height: 4.h),
                    if (contentWidget != null) contentWidget!,
                    if (contentWidget != null) SizedBox(height: 4.h),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          customButtonCancel ?? CustomButtonNew(
                            label: cancelButtonName ?? 'Cancel'.i18n,
                            width: width,
                            height: height ?? 43,
                            horizontalPadding: horizontalPadding,
                            verticalPadding: verticalPadding,
                            onPressed: onPressCancel ??
                                () {
                                  Navigator.of(context).pop();
                                },
                            backGroundColor: const Color(0xFFF7F9FA),
                            borderColor: const Color(0xFFDCE7ED),
                            colorText: const Color(0xFF2F4D87).withOpacity(0.5),
                          ),
                          SizedBox(width: spaceButton ?? 3.w),
                          customButtonOk ?? CustomButtonNew(
                            label: okButtonName ?? 'OK'.i18n,
                            width: width,
                            height: height ?? 43,
                            horizontalPadding: horizontalPadding,
                            verticalPadding: verticalPadding,
                            onPressColor: const Color(0xFF2F4D87),
                            onPressed: onPressOk,
                            backGroundColor: const Color(0xFF2F4D87),
                            colorText: const Color(0xFFFFFFFF),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
