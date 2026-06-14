import 'package:flutter/material.dart';

class AppColors {
  static const Color background = Color(0xff080A12);
  static const Color surface = Color(0xff121520);
  static const Color primary = Color(0xffEE403D);
  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Color(0xff9BA3BC);
  static const Color cardBg = Color(0xff1A1E2E);
  static const Color divider = Color(0xff2A2F45);
}

class AppTextStyles {
  static const String fontFamily = 'SpaceGrotesk';

  static const TextStyle header = TextStyle(
    fontSize: 52,
    fontWeight: FontWeight.w900,
    color: AppColors.textPrimary,
    fontFamily: fontFamily,
    height: 1.1,
    letterSpacing: -1,
  );

  static const TextStyle title = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    fontFamily: fontFamily,
  );

  static const TextStyle subTitle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    fontFamily: fontFamily,
  );

  static const TextStyle body = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w300,
    color: AppColors.textSecondary,
    fontFamily: fontFamily,
    height: 1.6,
  );

  static const TextStyle bodyBold = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    fontFamily: fontFamily,
  );

  static const TextStyle label = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
    fontFamily: fontFamily,
    letterSpacing: 0.5,
  );
}
