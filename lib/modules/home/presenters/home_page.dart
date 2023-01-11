import 'package:berna_libary/design/fonts/app_fonts.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          "HOME PAGE",
          style: AppFonts.basicFont,
        ),
      ),
    );
  }
}
