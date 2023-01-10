import 'package:berna_libary/core/blocs/app_theme_bloc/app_theme_events.dart';
import 'package:berna_libary/core/blocs/app_theme_bloc/app_theme_states.dart';
import 'package:berna_libary/design/animations/app_animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rive/rive.dart';

class ThemeButton extends StatefulWidget {
  const ThemeButton({super.key});

  @override
  State<ThemeButton> createState() => _ThemeButtonState();
}

class _ThemeButtonState extends State<ThemeButton> {
  StateMachineController? stateMachineController;
  SMIInput<bool>? isDark;
  final appBloc = Modular.get<Bloc<AppThemeEvents, AppThemeStates>>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        appBloc.add(ChangeAppTheme());
        final blocState = appBloc.state;
        if (blocState is AppThemeSuccess) {
          isDark?.change(blocState.themeMode != ThemeMode.dark);
        }
      },
      child: SizedBox(
        height: 50,
        width: 50,
        child: RiveAnimation.asset(
          AppAnimations.themeButton,
          fit: BoxFit.fitWidth,
          onInit: (artboard) {
            stateMachineController = StateMachineController.fromArtboard(
              artboard,
              "State Machine 1",
            );

            if (stateMachineController == null) {
              debugPrint("theme_button stateMachine null");
              return;
            }

            artboard.addController(stateMachineController!);
            isDark = stateMachineController!.findInput("isDark");
            final blocState = appBloc.state;
            if (blocState is AppThemeSuccess) {
              isDark?.change(blocState.themeMode == ThemeMode.dark);
            }
          },
        ),
      ),
    );
  }
}
