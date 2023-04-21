import 'package:ai_care/utils/responsive.dart';
import 'package:flutter/material.dart';

class CustomButtonNew extends StatelessWidget {
  const CustomButtonNew({
    required this.label,
    required this.onPressed,
    required this.colorText,
    required this.backGroundColor,
    Key? key,
    this.onPressColor,
    this.radius,
    this.horizontalPadding,
    this.verticalPadding,
    this.width,
    this.height,
    this.fontSize,
    this.borderColor,
    this.onHover,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Color colorText;
  final Color? borderColor;
  final Color backGroundColor;
  final Color? onPressColor;
  final double? horizontalPadding;
  final double? verticalPadding;
  final String label;
  final double? radius;
  final double? fontSize;
  final Function()? onHover;

  final Function? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 115,
      height: height ?? 45,
      child: TextButton(
        onPressed: () {
          onPressed!();
          FocusScope.of(context).unfocus();
        },
        style: TextButton.styleFrom(
          foregroundColor: onPressColor,
          backgroundColor: backGroundColor,
          padding: Responsive.isMobile
              ? EdgeInsets.symmetric(horizontal: horizontalPadding ?? 25, vertical: verticalPadding ?? 8)
              : EdgeInsets.symmetric(horizontal: horizontalPadding ?? 20, vertical: verticalPadding ?? 5),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: borderColor ?? Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(radius ?? 8),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: colorText,
            fontSize: fontSize ?? (Responsive.isMobile ? 16 : 16),
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
