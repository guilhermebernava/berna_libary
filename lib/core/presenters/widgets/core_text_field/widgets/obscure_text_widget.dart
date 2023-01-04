import 'package:flutter/material.dart';

class ObscureTextWidget extends StatelessWidget {
  final VoidCallback onTap;
  final bool isShow;
  final bool isHidden;

  const ObscureTextWidget({
    super.key,
    required this.onTap,
    required this.isShow,
    required this.isHidden,
  });

  @override
  Widget build(BuildContext context) {
    return isShow
        ? GestureDetector(
            onTap: onTap,
            child: Icon(
              isHidden
                  ? Icons.remove_red_eye_outlined
                  : Icons.remove_red_eye_rounded,
            ),
          )
        : Container();
  }
}
