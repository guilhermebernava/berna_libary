import 'package:berna_libary/design/colors/app_colors.dart';
import 'package:berna_libary/design/fonts/app_fonts.dart';
import 'package:flutter/material.dart';

class SnackbarServices {
  static void showErrorSnackbar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 2,
        backgroundColor: AppColors.red,
        duration: const Duration(seconds: 3),
        dismissDirection: DismissDirection.up,
        content: Text(
          text,
          textAlign: TextAlign.center,
          style: AppFonts.snackBarError,
        ),
      ),
    );
  }

  static void showSnackbar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 2,
        backgroundColor: AppColors.green,
        duration: const Duration(seconds: 3),
        dismissDirection: DismissDirection.up,
        content: Text(
          text,
          textAlign: TextAlign.center,
          style: AppFonts.snackBarError,
        ),
      ),
    );
  }
}
