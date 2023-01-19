import 'package:flutter/material.dart';

abstract class AppThemeStates {}

class AppThemeSuccess implements AppThemeStates {
  final ThemeMode themeMode;

  AppThemeSuccess({
    required this.themeMode,
  });
}

class AppThemeError implements AppThemeStates {
  final String message;
  final String exception;

  AppThemeError({
    required this.exception,
    required this.message,
  });
}
