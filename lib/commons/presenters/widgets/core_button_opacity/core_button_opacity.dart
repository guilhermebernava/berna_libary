import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CoreButtonOpacity extends StatefulWidget {
  final VoidCallback onTap;
  final Widget child;
  final EdgeInsets padding;

  const CoreButtonOpacity({
    super.key,
    required this.child,
    required this.onTap,
    this.padding = const EdgeInsets.symmetric(vertical: 10),
  });

  @override
  State<CoreButtonOpacity> createState() => _CoreButtonOpacityState();
}

class _CoreButtonOpacityState extends State<CoreButtonOpacity> {
  bool isClicked = false;

  void changeClicked(bool val) async {
    if (mounted) {
      setState(() {
        isClicked = val;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: GestureDetector(
        onTapUp: (_) => changeClicked(false),
        onDoubleTap: () async {
          changeClicked(true);
          HapticFeedback.selectionClick();
          await Future.delayed(
            const Duration(milliseconds: 200),
            () {
              widget.onTap();
              changeClicked(false);
            },
          );
        },
        child: AnimatedOpacity(
            opacity: isClicked ? 0.7 : 1.0,
            duration: const Duration(milliseconds: 200),
            child: widget.child),
      ),
    );
  }
}
