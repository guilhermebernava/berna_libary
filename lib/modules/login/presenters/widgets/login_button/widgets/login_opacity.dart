import 'package:flutter/material.dart';

class LoginOpacity extends StatefulWidget {
  final Widget child;
  final ValueNotifier<bool> canAnimate;

  const LoginOpacity({
    super.key,
    required this.child,
    required this.canAnimate,
  });

  @override
  State<LoginOpacity> createState() => _LoginOpacityState();
}

class _LoginOpacityState extends State<LoginOpacity> {
  bool _canAnimate = false;

  void animation() {
    if (widget.canAnimate.value && mounted) {
      Future.delayed(const Duration(milliseconds: 700), () {
        if (mounted) {
          setState(() {
            _canAnimate = true;
          });
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
    widget.canAnimate.addListener(animation);
  }

  @override
  void dispose() {
    super.dispose();
    widget.canAnimate.removeListener(animation);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(seconds: 2),
      opacity: _canAnimate ? 1.0 : 0.0,
      child: widget.child,
    );
  }
}
