import 'package:berna_libary/design/colors/app_colors.dart';
import 'package:berna_libary/modules/splash/domain/interfaces/i_animation_use_case.dart';
import 'package:flutter/material.dart';

class AnimatedSplash extends StatelessWidget {
  final IAnimationUseCase animationUseCase;
  const AnimatedSplash({
    super.key,
    required this.animationUseCase,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationUseCase.transformAnimation,
      builder: (context, child) => AnimatedBuilder(
        animation: animationUseCase.animation,
        builder: (__, _) => Transform.rotate(
          angle: animationUseCase.animation.value,
          child: Align(
            alignment: animationUseCase.transformAnimation.value,
            child: const Icon(
              Icons.music_note_sharp,
              size: 50,
              color: AppColors.primary,
            ),
          ),
        ),
      ),
    );
  }
}
