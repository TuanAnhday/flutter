import 'package:sizer/sizer.dart';

mixin Responsive {
  //  static bool get isMobile => 100.w / 100.h < 0.75;
  static bool get isMobile => SizerUtil.deviceType == DeviceType.mobile;
  static double  get sizeText => isMobile ? 12.sp : 8.sp;
  static double  get sizeTextEdit => isMobile ? 10.sp : 6.sp;
  static double  get fillIn => isMobile ? 9.sp : 5.5.sp;
  static double  get sizeImage => isMobile ? 2.5 : 1.5;
  static double  get sizeOperator => isMobile ? 12.sp : 7.sp;
  static double  get sizeTextFeature => isMobile ? 14 : 17;
}
