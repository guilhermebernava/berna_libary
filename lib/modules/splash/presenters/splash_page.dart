import 'package:berna_libary/core/blocs/app_theme_bloc/app_theme_events.dart';
import 'package:berna_libary/core/blocs/app_theme_bloc/app_theme_states.dart';
import 'package:berna_libary/design/fonts/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatelessWidget {
  final Bloc<AppThemeEvents, AppThemeStates> bloc;
  const SplashPage({
    super.key,
    required this.bloc,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "teste",
              style: AppFonts.basicFont,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              bloc.add(ChangeAppTheme());
            },
            child: const Text(
              "Change THEME",
            ),
          )
        ],
      ),
    );
  }
}
