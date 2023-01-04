import 'package:berna_libary/design/colors/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.black,
    colorScheme: const ColorScheme.dark(),
    primaryColor: AppColors.darkPrimary,
    brightness: Brightness.dark,
  );
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    colorScheme: const ColorScheme.light(),
    primaryColor: AppColors.primary,
    brightness: Brightness.light,
  );
}
