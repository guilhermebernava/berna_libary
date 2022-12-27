import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

abstract class IAnimationUseCase implements Disposable {
  late final AnimationController controller;
  late final Animation<double> animation;
  late final AnimationController transformController;
  late final Animation<Alignment> transformAnimation;

  void playAnimation(bool isMounted);
}
