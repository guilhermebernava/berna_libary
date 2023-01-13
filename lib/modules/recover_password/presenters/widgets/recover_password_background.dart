import 'dart:ui';
import 'package:berna_libary/design/animations/app_animations.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class RecoverPasswordBackground extends StatelessWidget {
  final Widget child;
  const RecoverPasswordBackground({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          const RiveAnimation.asset(
            AppAnimations.signUp,
            fit: BoxFit.fitWidth,
          ),
          BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 1.5,
              sigmaY: 1.5,
            ),
            child: child,
          ),
        ],
      ),
    );
  }
}
