import 'package:berna_libary/commons/auth/interfaces/use_cases/i_auth_use_case.dart';
import 'package:berna_libary/commons/auth/use_cases/auth_use_case.dart';
import 'package:berna_libary/commons/domain/extensions/dartz_extension.dart';
import 'package:berna_libary/commons/value_objects/email.dart';
import 'package:berna_libary/modules/recover_password/domain/interfaces/i_recover_password_use_case.dart';
import 'package:flutter/material.dart';
import 'package:berna_libary/modules/recover_password/domain/model/recover_password_model.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RecoverPasswordUseCase implements IRecoverPasswordUseCase {
  @override
  String loginRoute;
  @override
  IAuthUseCase authUseCase = Modular.get<AuthUseCase>();
  @override
  RecoverPasswordModel model = RecoverPasswordModel.empty();

  RecoverPasswordUseCase({
    required this.loginRoute,
  });

  @override
  Future<String?> changePassword(
    GlobalKey<FormState> key,
    BuildContext context,
  ) async {
    if (key.currentState?.validate() == false) {
      return "";
    }

    final result = await authUseCase.resetPassword(email: model.email.value);

    if (result.isLeft()) {
      return result.left().error;
    }

    return null;
  }

  @override
  void clearEmail() {
    model.email = Email();
  }

  @override
  Future<void> redirect() async {
    Future.delayed(
      const Duration(seconds: 3),
      () => Modular.to.navigate(loginRoute),
    );
  }
}
