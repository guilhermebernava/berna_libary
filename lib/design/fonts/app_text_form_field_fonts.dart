import 'package:berna_libary/design/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextFormFieldsFonts {
  static final hintTextFont = GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.w300,
  );
  static final forgotYourPassword = GoogleFonts.roboto(
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );
  static final textformFieldTextFont = GoogleFonts.roboto(
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );
  static final textformFieldError = GoogleFonts.roboto(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.red,
  );
  static final textformFieldTitleFont = GoogleFonts.roboto(
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );
}
