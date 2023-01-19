import 'package:berna_libary/commons/services/snackbar/snackbar_services.dart';
import 'package:flutter/material.dart';

class ValidateServices {
  static bool validateFutureString(
    String? value,
    BuildContext context,
  ) {
    if (value != null) {
      if (value.length < 2) {
        return false;
      }
      SnackbarServices.showErrorSnackbar(context, value);
      return false;
    }
    return true;
  }
}
