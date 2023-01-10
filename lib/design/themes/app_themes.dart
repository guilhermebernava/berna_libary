import 'package:berna_libary/design/colors/app_colors.dart';
import 'package:berna_libary/design/fonts/app_fonts.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.black,
    colorScheme: const ColorScheme.dark(),
    primaryColor: AppColors.primary,
    brightness: Brightness.dark,
  );
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    colorScheme: const ColorScheme.light(primary: AppColors.black),
    textTheme: TextTheme(
      button: AppFonts.basicFont,
    ),
    primaryColor: AppColors.primary,
    brightness: Brightness.light,
  );
}
