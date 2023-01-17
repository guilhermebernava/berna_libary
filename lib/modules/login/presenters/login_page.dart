import 'package:berna_libary/core/presenters/widgets/core_text_field/core_text_field.dart';
import 'package:berna_libary/core/presenters/widgets/form_with_key/form_with_key.dart';
import 'package:berna_libary/modules/login/domain/interfaces/i_login_use_case.dart';
import 'package:berna_libary/modules/login/presenters/widgets/login_background.dart';
import 'package:berna_libary/modules/login/presenters/widgets/login_button/login_button.dart';
import 'package:berna_libary/modules/login/presenters/widgets/login_button/widgets/login_icon.dart';
import 'package:berna_libary/modules/login/presenters/widgets/login_button/widgets/login_opacity.dart';
import 'package:flutter/material.dart';

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const LoginIconAnimated(),
              LoginOpacity(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
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
                      height: size.height * 0.05,
                    ),
                    LoginButton(
                      useCase: useCase,
                      size: size,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
