import 'package:berna_libary/core/presenters/widgets/core_api_button/core_api_button.dart';
import 'package:berna_libary/core/presenters/widgets/core_text_field/core_text_field.dart';
import 'package:berna_libary/core/presenters/widgets/form_with_key/form_with_key.dart';
import 'package:berna_libary/modules/sign_up/domain/interfaces/i_sign_up_use_case.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  final ISignUpUseCase useCase;

  const SignUpPage({
    super.key,
    required this.useCase,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(),
      body: FormWithKey(
        mainAxisAlignment: MainAxisAlignment.center,
        formKey: useCase.formKey,
        children: [
          CoreTextField(
            title: "Name",
            obscureText: false,
            hintText: "John Example",
            onChanged: (value) => useCase.model.name(value),
            validator: (_) => useCase.model.name.validator(),
          ),
          CoreTextField(
            title: "Email",
            obscureText: false,
            hintText: "teste@teste.com",
            onChanged: (value) => useCase.model.email(value),
            validator: (_) => useCase.model.email.validator(),
          ),
          CoreTextField(
            title: "Password",
            obscureText: true,
            onChanged: (value) => useCase.model.password(value),
            validator: (_) => useCase.model.password.validator(),
            hintText: "********",
          ),
          CoreTextField(
            title: "Confirm Password",
            obscureText: true,
            onChanged: (value) => useCase.model.confirmPassword(value),
            validator: (_) => useCase.model.confirmPassword.validator(),
            hintText: "********",
          ),
          CoreApiButton(
            text: "Sign Up",
            size: size,
            onTap: () async {
              await Future.delayed(const Duration(seconds: 3));
              return true;
            },
          ),
        ],
      ),
    );
  }
}
