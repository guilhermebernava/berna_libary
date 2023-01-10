import 'dart:ui';
import 'package:berna_libary/core/presenters/widgets/core_text_field/core_text_field.dart';
import 'package:berna_libary/core/presenters/widgets/form_with_key/form_with_key.dart';
import 'package:berna_libary/core/presenters/widgets/theme_button.dart';
import 'package:berna_libary/modules/login/domain/interfaces/i_login_use_case.dart';
import 'package:berna_libary/modules/login/presenters/widgets/background_login.dart';
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
      body: Stack(
        fit: StackFit.expand,
        children: [
          const BackgroundLogin(),
          BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 3.0,
              sigmaY: 3.0,
            ),
            child: FormWithKey(
              formKey: useCase.formKey,
              children: [
                Align(
                  alignment: const Alignment(-0.9, 2),
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom: size.height * 0.1,
                    ),
                    child: const ThemeButton(),
                  ),
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
                  validator: (p0) => "erro no email",
                ),
                CoreTextField(
                  title: "Senha",
                  counterText: "Forgot your password ?",
                  onCounterTap: () {},
                  obscureText: true,
                  validator: (p0) => "erro na senha",
                  hintText: "********",
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                LoginButton(
                  size: size,
                  useCase: useCase,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
