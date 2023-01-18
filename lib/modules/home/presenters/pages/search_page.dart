import 'package:berna_libary/design/fonts/app_fonts.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  static const route = "/Search";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Search",
          style: AppFonts.basicFont,
        ),
      ),
    );
  }
}
