import 'package:berna_libary/modules/sign_up/domain/interfaces/i_sign_up_use_case.dart';
import 'package:berna_libary/modules/sign_up/domain/model/create_user_model.dart';
import 'package:berna_libary/modules/sign_up/domain/services/check_password.dart';
import 'package:flutter/material.dart';

class SignUpUseCase implements ISignUpUseCase {
  @override
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  CreateUserModel model = CreateUserModel.empty();

  @override
  Future<String?> createUser() async {
    return "create User";
  }

  @override
  Future<String?> validateInputs() async {
    if (formKey.currentState == null) {
      return "Do not exist formKey in this moment";
    }

    if (formKey.currentState!.validate() == false) {
      return null;
    }

    if (CheckPasswordServices.confirmPassword(
            password: model.password.value,
            confirmPassword: model.confirmPassword.value) ==
        false) {
      return "passwords don't are equal";
    }

    return await createUser();
  }
}
