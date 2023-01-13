import 'package:berna_libary/core/domain/extensions/dartz_extension.dart';
import 'package:berna_libary/core/domain/interfaces/use_cases/i_auth_use_case.dart';
import 'package:berna_libary/core/domain/use_cases/auth_use_case.dart';
import 'package:berna_libary/modules/sign_up/domain/interfaces/i_sign_up_use_case.dart';
import 'package:berna_libary/modules/sign_up/domain/model/create_user_model.dart';
import 'package:berna_libary/modules/sign_up/domain/services/check_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SignUpUseCase implements ISignUpUseCase {
  @override
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  CreateUserModel model = CreateUserModel.empty();
  @override
  IAuthUseCase authUseCase = Modular.get<AuthUseCase>();
  @override
  String homeRoute;

  SignUpUseCase({
    required this.homeRoute,
  });

  @override
  Future<String?> createUser() async {
    final user = await authUseCase.createUser(
      email: model.email.value,
      password: model.password.value,
    );

    if (user.isLeft()) {
      return user.left().error;
    }

    Modular.to.navigate(homeRoute);
    return null;
  }

  @override
  Future<String?> validateInputs() async {
    if (formKey.currentState == null) {
      return "Do not exist formKey in this moment";
    }

    if (formKey.currentState!.validate() == false) {
      return "";
    }

    if (CheckPasswordServices.confirmPassword(
          password: model.password.value,
          confirmPassword: model.confirmPassword.value,
        ) ==
        false) {
      return "passwords don't are equal";
    }

    return await createUser();
  }
}
