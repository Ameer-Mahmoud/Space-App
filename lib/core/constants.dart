import 'package:flutter/material.dart';

class AppColors {
  static const Color background = Color(0xff0E0E0E);
  static const Color primary = Color(0xffEE403D);
  static const Color textPrimary = Colors.white;
}

class AppTextStyles {
  static const String fontFamily = 'SpaceGrotesk';

  static const TextStyle header = TextStyle(
    fontSize: 50,
    fontWeight: FontWeight.w900,
    color: AppColors.textPrimary,
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
    fontSize: 16,
    fontWeight: FontWeight.w300,
    color: AppColors.textPrimary,
    fontFamily: fontFamily,
  );

  static const TextStyle bodyBold = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    fontFamily: fontFamily,
  );
}
