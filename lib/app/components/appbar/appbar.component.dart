import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

PreferredSizeWidget staticAppbar({
  double? height,
  Widget? title,
  List<Widget>? actions,
  Widget? leading,
  Color? backgroundColor,
  PreferredSizeWidget? bottomWidget,
  double? titleSpacing,
  bool? centerTitle,
  SystemUiOverlayStyle systemOverlayStyle = SystemUiOverlayStyle.light,
}) =>
    AppBar(
      toolbarHeight: height,
      backgroundColor: backgroundColor ?? const Color(0xff00b4ff),
      title: title,
      elevation: 0,
      systemOverlayStyle: systemOverlayStyle,
      centerTitle: centerTitle,
      actions: actions,
      automaticallyImplyLeading: true,
      leading: leading,
      bottom: bottomWidget,
      titleSpacing: titleSpacing ?? NavigationToolbar.kMiddleSpacing,
    );

class BackButtonWidget extends StatelessWidget {
  final Color? iconColor;
  final String? path;
  double? size;
  final Function()? onPressed;

  BackButtonWidget({
    Key? key,
    this.iconColor,
    this.path,
    this.onPressed,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return size == null
        ? IconButton(
            icon: path == null
                ? SvgPicture.asset(
                    'assets/images/home/back-button.svg',
                    color: iconColor,
                  )
                : SvgPicture.asset(path!, color: iconColor),
            onPressed: onPressed ?? Navigator.of(context).pop,
          )
        : IconButton(
            icon: path == null
                ? SvgPicture.asset(
                    'assets/images/home/back-button.svg',
                    color: iconColor,
                    height: size!,
                    width: size!,
                  )
                : SvgPicture.asset(
                    path!,
                    color: iconColor,
                    height: size!,
                    width: size!,
                  ),
            onPressed: onPressed ?? Navigator.of(context).pop,
          );
  }
}
