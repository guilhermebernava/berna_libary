import 'package:berna_libary/commons/app_theme/app_theme_bloc/app_theme_events.dart';
import 'package:berna_libary/commons/app_theme/app_theme_bloc/app_theme_states.dart';
import 'package:berna_libary/modules/splash/domain/interfaces/i_animation_use_case.dart';
import 'package:berna_libary/modules/splash/domain/interfaces/i_splash_use_case.dart';
import 'package:berna_libary/modules/splash/domain/use_cases/animation_use_case.dart';
import 'package:berna_libary/modules/splash/presenters/widgets/animated_splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatefulWidget {
  final Bloc<AppThemeEvents, AppThemeStates> bloc;
  final ISplashUseCase useCase;

  const SplashPage({
    super.key,
    required this.bloc,
    required this.useCase,
  });

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late final IAnimationUseCase animationUseCase;
  @override
  void initState() {
    super.initState();
    animationUseCase = AnimationUseCase(ticket: this);
    animationUseCase.playAnimation(mounted, widget.useCase.redirectToNextPage);
  }

  @override
  void dispose() {
    super.dispose();
    widget.useCase.dispose();
    animationUseCase.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplash(
        animationUseCase: animationUseCase,
      ),
    );
  }
}
