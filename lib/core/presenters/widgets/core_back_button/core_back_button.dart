import 'package:berna_libary/design/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CoreBackButton extends StatelessWidget {
  final Size size;
  final VoidCallback? onTap;

  const CoreBackButton({
    super.key,
    this.onTap,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 50,
        bottom: 10,
        right: size.width * 0.8,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: onTap ?? () => Modular.to.pop(),
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: AppColors.white,
              size: 25,
            ),
          ),
        ],
      ),
    );
  }
}
