import 'package:berna_libary/design/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppLoginButtonFonts {
  static final loginButton = GoogleFonts.roboto(
    fontSize: 20,
    color: AppColors.white,
    fontWeight: FontWeight.w600,
  );

  static final loginText = GoogleFonts.roboto(
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  static final loginTextUnderline = GoogleFonts.roboto(
    fontSize: 12,
    decoration: TextDecoration.underline,
    fontWeight: FontWeight.w400,
  );
}
