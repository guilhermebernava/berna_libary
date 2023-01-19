import 'package:berna_libary/design/colors/app_colors.dart';
import 'package:berna_libary/modules/home/design/app_home_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BottomBarIconButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;
  final bool isSelected;

  const BottomBarIconButton({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: GestureDetector(
        onTap: () {
          HapticFeedback.lightImpact();
          onTap();
        },
        child: SizedBox(
          height: 62,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 25,
                color: isSelected ? AppColors.primary : AppColors.white,
              ),
              const SizedBox(
                height: 8,
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
