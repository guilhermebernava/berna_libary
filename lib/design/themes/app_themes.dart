import 'package:berna_libary/design/colors/app_colors.dart';
import 'package:berna_libary/design/fonts/app_fonts.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.black,
    backgroundColor: AppColors.black,
    canvasColor: Colors.transparent,
    colorScheme: const ColorScheme.dark(),
    appBarTheme: const AppBarTheme(
      color: Colors.transparent,
      elevation: 0,
    ),
    primaryColor: AppColors.primary,
    brightness: Brightness.dark,
  );
  static final lightTheme = ThemeData(
    canvasColor: Colors.transparent,
    scaffoldBackgroundColor: AppColors.white,
    colorScheme: const ColorScheme.light(primary: AppColors.black),
    backgroundColor: AppColors.white,
    appBarTheme: const AppBarTheme(
      color: Colors.transparent,
      elevation: 0,
    ),
    iconTheme: const IconThemeData(
      color: AppColors.primary,
    ),
    textTheme: TextTheme(
      button: AppFonts.basicFont,
    ),
    primaryColor: AppColors.primary,
    brightness: Brightness.light,
  );
}
