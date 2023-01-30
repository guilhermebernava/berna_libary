import 'package:berna_libary/design/colors/app_colors.dart';
import 'package:flutter/material.dart';

class MusicButton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  const MusicButton({
    super.key,
    required this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(
        icon,
        size: 40,
        color: AppColors.white,
      ),
    );
  }
}
