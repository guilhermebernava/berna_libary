import 'package:berna_libary/core/blocs/app_theme_bloc/app_theme_events.dart';
import 'package:berna_libary/core/blocs/app_theme_bloc/app_theme_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppThemeBloc extends Bloc<AppThemeEvents, AppThemeStates> {
  ThemeMode themeMode;
  AppThemeBloc(this.themeMode)
      : super(
          AppThemeSuccess(themeMode: themeMode),
        ) {
    on<ChangeAppTheme>((event, emit) {
      if (themeMode == ThemeMode.dark) {
        themeMode = ThemeMode.light;
      } else {
        themeMode = ThemeMode.dark;
      }
      emit(
        AppThemeSuccess(
          themeMode: themeMode,
        ),
      );
    });
  }
}
