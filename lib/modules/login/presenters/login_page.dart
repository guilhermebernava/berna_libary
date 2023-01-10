import 'dart:ui';
import 'package:berna_libary/core/presenters/widgets/core_text_field/core_text_field.dart';
import 'package:berna_libary/core/presenters/widgets/form_with_key/form_with_key.dart';
import 'package:berna_libary/modules/login/domain/interfaces/i_login_use_case.dart';
import 'package:berna_libary/modules/login/presenters/widgets/login_button/login_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rive/rive.dart';

class LoginPage extends StatefulWidget {
  final ILoginUseCase useCase;

  const LoginPage({
    super.key,
    required this.useCase,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    StateMachineController? stateMachineController;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          //TODO adicionar botao para mudar DARKMODE
          RiveAnimation.asset(
            'assets/background.riv',
            fit: BoxFit.fill,
            onInit: (art) {
              stateMachineController =
                  StateMachineController.fromArtboard(art, "state")!;

              if (stateMachineController == null) {
                return;
              }
              art.addController(stateMachineController!);
            },
          ),
          BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 3.0,
              sigmaY: 3.0,
            ),
            child: FormWithKey(
              formKey: widget.useCase.formKey,
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
                  useCase: widget.useCase,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
