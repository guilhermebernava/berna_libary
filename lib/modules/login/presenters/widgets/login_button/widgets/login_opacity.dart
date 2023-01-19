import 'package:flutter/material.dart';

class LoginOpacity extends StatefulWidget {
  final Widget child;
  final bool canAnimate;

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

  @override
  void initState() {
    super.initState();

    if (widget.canAnimate) {
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
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(seconds: 2),
      opacity: _canAnimate ? 1.0 : 0.0,
      child: widget.child,
    );
  }
}
