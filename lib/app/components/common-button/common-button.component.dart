import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CommonButton extends StatelessWidget {
  CommonButton({
    super.key,
    required this.onPressed,
    required this.child,
    required this.backgroundColor,
    this.radius = 30,
    this.borderColor = Colors.transparent,
    double? width,
    double? height,
  })  : height = height ?? 5.h,
        width = width ?? 80.w;
  final VoidCallback onPressed;
  final Widget child;
  final Color backgroundColor;
  late final double width;
  final double height;
  final double radius;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius.sp), side: BorderSide(color: borderColor)),
      ),
      child: Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        child: child,
      ),
    );
  }
}
