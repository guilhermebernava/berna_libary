import 'package:berna_libary/commons/presenters/widgets/core_loading.dart';
import 'package:flutter/material.dart';

class HomeFutureBuilder extends StatefulWidget {
  final Widget child;
  final Future future;
  const HomeFutureBuilder({
    super.key,
    required this.child,
    required this.future,
  });

  @override
  State<HomeFutureBuilder> createState() => _HomeFutureBuilderState();
}

class _HomeFutureBuilderState extends State<HomeFutureBuilder> {
  bool canAnimate = false;

  void changeCanAnimate() {
    Future.delayed(const Duration(seconds: 0), () {
      if (mounted) {
        setState(() {
          canAnimate = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.future,
      builder: (context, snap) {
        if (snap.connectionState == ConnectionState.done) {
          changeCanAnimate();
          return AnimatedOpacity(
            opacity: canAnimate ? 1.0 : 0.0,
            duration: const Duration(
              seconds: 1,
            ),
            child: widget.child,
          );
        }
        return const CoreLoading();
      },
    );
  }
}
