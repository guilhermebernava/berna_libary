import 'package:berna_libary/commons/presenters/widgets/core_api_button/widgets/core_api_button_text.dart';
import 'package:berna_libary/design/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CoreButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;

  const CoreButton({
    super.key,
    required this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: GestureDetector(
        onTap: () {
          HapticFeedback.mediumImpact();
          onTap();
        },
        child: Container(
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(
              100,
            ),
          ),
          child: Center(
            child: CoreApiButtonText(
              text: text,
            ),
          ),
        ),
      ),
    );
  }
}
