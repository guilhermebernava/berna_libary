import 'package:berna_libary/design/fonts/app_text_form_field_fonts.dart';
import 'package:flutter/material.dart';

class TextFormCounter extends StatelessWidget {
  final String? counterText;
  final VoidCallback? onCounterTap;

  const TextFormCounter({
    super.key,
    required this.counterText,
    required this.onCounterTap,
  });

  @override
  Widget build(BuildContext context) {
    return counterText != null
        ? GestureDetector(
            onTap: onCounterTap,
            child: Text(
              counterText!,
              style: AppTextFormFieldsFonts.forgotYourPassword,
            ),
          )
        : const SizedBox(
            width: 0,
            height: 0,
          );
  }
}
