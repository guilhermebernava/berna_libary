import 'dart:async';

import 'package:berna_libary/commons/presenters/widgets/core_text_field/core_text_field.dart';
import 'package:berna_libary/commons/presenters/widgets/form_with_key/form_with_key.dart';
import 'package:berna_libary/commons/user/app_user_bloc/app_user_events.dart';
import 'package:berna_libary/commons/user/app_user_bloc/app_user_states.dart';
import 'package:berna_libary/modules/login/domain/interfaces/i_login_use_case.dart';
import 'package:berna_libary/modules/login/presenters/widgets/login_background.dart';
import 'package:berna_libary/modules/login/presenters/widgets/login_button/login_button.dart';
import 'package:berna_libary/modules/login/presenters/widgets/login_button/widgets/login_icon.dart';
import 'package:berna_libary/modules/login/presenters/widgets/login_button/widgets/login_opacity.dart';
import 'package:flutter/material.dart';

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
  late final StreamSubscription subscription;
  bool canAnimate = false;

  void onChangeState(AppUserStates state) {
    if (state is LoggedUser) {
      widget.useCase.redirectToHome();
      return;
    }

    if (mounted) {
      setState(() {
        canAnimate = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    widget.useCase.appUserBloc.add(GetUser());
    subscription = widget.useCase.appUserBloc.stream.listen(onChangeState);
  }

  @override
  void dispose() async {
    super.dispose();
    await subscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: LoginBackground(
        child: FormWithKey(
          formKey: widget.useCase.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              LoginIconAnimated(
                canAnimate: canAnimate,
              ),
              LoginOpacity(
                canAnimate: canAnimate,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CoreTextField(
                      title: "Email",
                      obscureText: false,
                      hintText: "teste@teste.com",
                      onChanged: (value) =>
                          widget.useCase.loginModel.email(value),
                      validator: (_) =>
                          widget.useCase.loginModel.email.validator(),
                    ),
                    CoreTextField(
                      title: "Password",
                      counterText: "Forgot your password ?",
                      onCounterTap: () =>
                          widget.useCase.redirectToRecoverPassword(),
                      obscureText: true,
                      onChanged: (value) =>
                          widget.useCase.loginModel.password(value),
                      validator: (_) =>
                          widget.useCase.loginModel.password.validator(),
                      hintText: "********",
                    ),
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    LoginButton(
                      useCase: widget.useCase,
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
