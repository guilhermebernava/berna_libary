import 'package:berna_libary/core/blocs/app_theme_bloc/app_theme_bloc.dart';
import 'package:berna_libary/core/blocs/app_theme_bloc/app_theme_events.dart';
import 'package:berna_libary/core/blocs/app_theme_bloc/app_theme_states.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  blocTest<AppThemeBloc, AppThemeStates>(
    'emits [AppThemeSuccess] when have an success with ChangeAppTheme event',
    build: () => AppThemeBloc(ThemeMode.dark),
    act: (bloc) => bloc.add(ChangeAppTheme()),
    expect: () => [isA<AppThemeSuccess>()],
  );
}
