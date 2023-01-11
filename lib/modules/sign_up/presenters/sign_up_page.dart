import 'package:berna_libary/design/fonts/app_fonts.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          "Sign Up",
          style: AppFonts.basicFont,
        ),
      ),
    );
  }
}
