import 'dart:ui';

import 'package:berna_libary/core/blocs/app_theme_bloc/app_theme_events.dart';
import 'package:berna_libary/core/blocs/app_theme_bloc/app_theme_states.dart';
import 'package:berna_libary/core/presenters/widgets/core_text_field/core_text_field.dart';
import 'package:berna_libary/core/presenters/widgets/form_with_key/form_with_key.dart';
import 'package:berna_libary/modules/login/domain/interfaces/i_login_use_case.dart';
import 'package:berna_libary/modules/login/presenters/widgets/login_button/login_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatelessWidget {
  final Bloc<AppThemeEvents, AppThemeStates> appBloc = Modular.get();

  final ILoginUseCase useCase;
  LoginPage({
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
          BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 10.0,
              sigmaY: 10.0,
            ),
            child: FormWithKey(
              formKey: useCase.formKey,
              children: [
                SizedBox(
                  height: size.height * 0.15,
                ),
                const Icon(
                  FontAwesomeIcons.userAstronaut,
                  size: 150,
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
