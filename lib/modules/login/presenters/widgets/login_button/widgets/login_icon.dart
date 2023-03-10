import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginIconAnimated extends StatefulWidget {
  final ValueNotifier<bool> canAnimate;

  const LoginIconAnimated({
    super.key,
    required this.canAnimate,
  });

  @override
  State<LoginIconAnimated> createState() => _LoginIconState();
}

class _LoginIconState extends State<LoginIconAnimated>
    with TickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation animation;

  void playAnimation() {
    if (widget.canAnimate.value && mounted) {
      controller.forward();
    }
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));
    animation = Tween(begin: 300.0, end: 150.0).animate(controller);

    widget.canAnimate.addListener(playAnimation);
  }

  @override
  void dispose() {
    super.dispose();
    widget.canAnimate.removeListener(playAnimation);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animation,
        builder: (_, __) {
          return Icon(
            FontAwesomeIcons.userAstronaut,
            size: animation.value,
            color: Theme.of(context).iconTheme.color,
          );
        });
  }
}
