import 'package:berna_libary/design/fonts/app_login_button_fonts.dart';
import 'package:flutter/material.dart';

class CoreApiButtonText extends StatelessWidget {
  final String text;
  const CoreApiButtonText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppLoginButtonFonts.loginButton,
    );
  }
}
