import 'package:berna_libary/design/colors/app_colors.dart';
import 'package:berna_libary/modules/home/design/app_home_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BottomBarIconButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  const BottomBarIconButton({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: GestureDetector(
        onTap: () {
          HapticFeedback.lightImpact();
          onTap();
        },
        child: SizedBox(
          height: 62,
          child: Column(
            children: [
              Icon(
                icon,
                size: 40,
                color: AppColors.white,
              ),
              Text(
                text,
                style: AppHomeFonts.iconText,
              )
            ],
          ),
        ),
      ),
    );
  }
}
