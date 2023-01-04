import 'package:berna_libary/modules/splash/domain/interfaces/i_animation_use_case.dart';
import 'package:flutter/material.dart';

class AnimationUseCase implements IAnimationUseCase {
  @override
  late final Animation<double> animation;

  @override
  late final AnimationController controller;

  @override
  late final Animation<Alignment> transformAnimation;

  @override
  late final AnimationController transformController;

  AnimationUseCase({required TickerProviderStateMixin ticket}) {
    controller = AnimationController(
      vsync: ticket,
      duration: const Duration(
        milliseconds: 600,
      ),
    );

    animation = Tween(begin: 0.0, end: 1.0)
        .chain(
          TweenSequence(
            [
              TweenSequenceItem(
                tween: Tween(begin: 0.0, end: -0.6),
                weight: 1,
              ),
              TweenSequenceItem(
                tween: Tween(begin: -0.6, end: 0.15),
                weight: 1,
              ),
            ],
          ),
        )
        .animate(
          CurvedAnimation(
            parent: controller,
            curve: Curves.linear,
          ),
        );

    transformController = AnimationController(
      vsync: ticket,
      duration: const Duration(
        milliseconds: 1400,
      ),
    );

    transformAnimation = Tween(
      begin: const Alignment(0, 2),
      end: const Alignment(0, 0),
    ).animate(
      CurvedAnimation(
        parent: transformController,
        curve: Curves.bounceIn,
      ),
    );
  }

  @override
  void playAnimation(bool isMounted, void Function() redirect) {
    if (isMounted) {
      transformController.forward().then(
            (_) => controller.forward().then(
                  (_) => redirect(),
                ),
          );
    }
  }

  @override
  void dispose() {
    controller.dispose();
    transformController.dispose();
  }
}
