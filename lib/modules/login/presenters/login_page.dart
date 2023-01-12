import 'package:berna_libary/core/presenters/widgets/core_text_field/core_text_field.dart';
import 'package:berna_libary/core/presenters/widgets/form_with_key/form_with_key.dart';
import 'package:berna_libary/modules/login/domain/interfaces/i_login_use_case.dart';
import 'package:berna_libary/modules/login/presenters/widgets/login_background.dart';
import 'package:berna_libary/modules/login/presenters/widgets/login_button/login_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatelessWidget {
  final ILoginUseCase useCase;

  const LoginPage({
    super.key,
    required this.useCase,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: LoginBackground(
        child: FormWithKey(
          formKey: useCase.formKey,
          children: [
            SizedBox(
              height: size.height * 0.15,
            ),
            Icon(
              FontAwesomeIcons.userAstronaut,
              size: 150,
              color: Theme.of(context).iconTheme.color,
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            CoreTextField(
              title: "Email",
              obscureText: false,
              hintText: "teste@teste.com",
              onChanged: (value) => useCase.loginModel.email(value),
              validator: (_) => useCase.loginModel.email.validator(),
            ),
            CoreTextField(
              title: "Password",
              counterText: "Forgot your password ?",
              onCounterTap: () => useCase.redirectToRecoverPassword(),
              obscureText: true,
              onChanged: (value) => useCase.loginModel.password(value),
              validator: (_) => useCase.loginModel.password.validator(),
              hintText: "********",
            ),
            SizedBox(
              height: size.height * 0.07,
            ),
            LoginButton(
              useCase: useCase,
              size: size,
            )
          ],
        ),
      ),
    );
  }
}
