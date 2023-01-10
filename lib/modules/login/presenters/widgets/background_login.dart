import 'package:berna_libary/core/blocs/app_theme_bloc/app_theme_events.dart';
import 'package:berna_libary/core/blocs/app_theme_bloc/app_theme_states.dart';
import 'package:berna_libary/design/animations/app_animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rive/rive.dart';

class BackgroundLogin extends StatefulWidget {
  const BackgroundLogin({super.key});

  @override
  State<BackgroundLogin> createState() => _BackgroundLoginState();
}

class _BackgroundLoginState extends State<BackgroundLogin> {
  StateMachineController? stateMachineController;
  SMIInput<bool>? isDark;
  final appBloc = Modular.get<Bloc<AppThemeEvents, AppThemeStates>>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: appBloc,
      builder: (_, state) {
        if (state is AppThemeSuccess) {
          return RiveAnimation.asset(
            AppAnimations.backgroundLogin,
            fit: BoxFit.fill,
            onInit: (art) {
              stateMachineController =
                  StateMachineController.fromArtboard(art, "state")!;

              if (stateMachineController == null) {
                return;
              }
              art.addController(stateMachineController!);
              isDark = stateMachineController!.findInput("isDark");

              isDark?.change(state.themeMode == ThemeMode.dark);
            },
          );
        }
        return Container();
      },
    );
  }
}
