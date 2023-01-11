import 'package:berna_libary/design/fonts/app_fonts.dart';
import 'package:flutter/material.dart';

class RecoverPasswordPage extends StatelessWidget {
  const RecoverPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          "Recover Password",
          style: AppFonts.basicFont,
        ),
      ),
    );
  }
}
