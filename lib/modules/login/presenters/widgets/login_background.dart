import 'dart:ui';

import 'package:berna_libary/core/blocs/app_theme_bloc/app_theme_events.dart';
import 'package:berna_libary/core/blocs/app_theme_bloc/app_theme_states.dart';
import 'package:berna_libary/design/animations/app_animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rive/rive.dart';

class LoginBackground extends StatefulWidget {
  final Widget child;
  const LoginBackground({
    super.key,
    required this.child,
  });

  @override
  State<LoginBackground> createState() => _LoginBackgroundState();
}

class _LoginBackgroundState extends State<LoginBackground> {
  final appBloc = Modular.get<Bloc<AppThemeEvents, AppThemeStates>>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: appBloc,
      builder: (_, state) {
        if (state is AppThemeSuccess) {
          return Stack(
            fit: StackFit.expand,
            children: [
              const RiveAnimation.asset(
                AppAnimations.backgroundLogin,
                fit: BoxFit.fill,
              ),
              BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 3.0,
                  sigmaY: 3.0,
                ),
                child: widget.child,
              ),
            ],
          );
        }
        return Container();
      },
    );
  }
}
