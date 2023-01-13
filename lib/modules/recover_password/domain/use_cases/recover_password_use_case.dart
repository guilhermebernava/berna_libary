import 'package:berna_libary/core/domain/extensions/dartz_extension.dart';
import 'package:berna_libary/core/domain/interfaces/use_cases/i_auth_use_case.dart';
import 'package:berna_libary/core/domain/use_cases/auth_use_case.dart';
import 'package:berna_libary/core/value_objects/email.dart';
import 'package:berna_libary/core/value_objects/not_null.dart';
import 'package:berna_libary/core/value_objects/password.dart';
import 'package:berna_libary/modules/recover_password/domain/interfaces/i_recover_password_use_case.dart';
import 'package:berna_libary/modules/recover_password/presenters/pages/recover_password/recover_password.dart';
import 'package:berna_libary/modules/recover_password/presenters/pages/recover_token/recover_token.dart';
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
  Future<String?> changePassword(GlobalKey<FormState> key) async {
    if (key.currentState?.validate() == false) {
      return "";
    }

    final result = await authUseCase.resetPassword(
      token: model.token.value,
      password: model.password.value,
    );

    if (result.isLeft()) {
      return result.left().error;
    }

    Modular.to.navigate(loginRoute);
    return null;
  }

  @override
  Future<String?> validateEmail(GlobalKey<FormState> key) async {
    if (key.currentState?.validate() == false) {
      return "";
    }
    final result = await authUseCase.sendTokenToEmail(
      email: model.email.value,
    );

    if (result.isLeft()) {
      return result.left().error;
    }

    Modular.to.navigate(".${RecoverTokenPage.route}");
    return null;
  }

  @override
  Future<bool?> validateToken(GlobalKey<FormState> key) async {
    if (key.currentState?.validate() == false) {
      return null;
    }

    final result = await authUseCase.checkToken(token: model.token.value);

    if (result.isLeft()) {
      return false;
    }

    Modular.to.navigate(".${RecoverPasswordPage.route}");
    return true;
  }

  @override
  void clearEmail() {
    model.email = Email();
  }

  @override
  void clearPassword() {
    model.password = Password();
  }

  @override
  void clearToken() {
    model.token = NotNull(value: "");
  }
}
