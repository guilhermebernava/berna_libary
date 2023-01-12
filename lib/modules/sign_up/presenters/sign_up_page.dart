import 'package:berna_libary/core/presenters/widgets/core_api_button/core_api_button.dart';
import 'package:berna_libary/core/presenters/widgets/core_back_button/core_back_button.dart';
import 'package:berna_libary/core/presenters/widgets/core_text_field/core_text_field.dart';
import 'package:berna_libary/core/presenters/widgets/form_with_key/form_with_key.dart';
import 'package:berna_libary/core/services/snackbar/snackbar_services.dart';
import 'package:berna_libary/modules/sign_up/domain/interfaces/i_sign_up_use_case.dart';
import 'package:berna_libary/modules/sign_up/presenters/widgets/sign_up_background.dart';
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
      body: SignUpBackground(
        child: FormWithKey(
          mainAxisAlignment: MainAxisAlignment.start,
          formKey: useCase.formKey,
          children: [
            CoreBackButton(
              size: size,
            ),
            const SizedBox(
              height: 30,
            ),
            CoreTextField(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
              title: "Email",
              obscureText: false,
              hintText: "teste@teste.com",
              onChanged: (value) => useCase.model.email(value),
              validator: (_) => useCase.model.email.validator(),
            ),
            CoreTextField(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
              title: "Password",
              obscureText: true,
              onChanged: (value) => useCase.model.password(value),
              validator: (_) => useCase.model.password.validator(),
              hintText: "********",
            ),
            CoreTextField(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
              title: "Confirm Password",
              obscureText: true,
              onChanged: (value) => useCase.model.confirmPassword(value),
              validator: (_) => useCase.model.confirmPassword.validator(),
              hintText: "********",
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            CoreApiButton(
              text: "Sign Up",
              size: size,
              onTap: () async => await useCase.validateInputs().then((value) {
                if (value != null) {
                  SnackbarServices.showErrorSnackbar(context, value);
                  return false;
                }
                return true;
              }),
            ),
          ],
        ),
      ),
    );
  }
}
