import 'package:berna_libary/design/fonts/app_login_button_fonts.dart';
import 'package:berna_libary/modules/login/domain/interfaces/i_login_use_case.dart';
import 'package:flutter/material.dart';

class LoginTextButton extends StatelessWidget {
  final ILoginUseCase useCase;

  const LoginTextButton({
    super.key,
    required this.useCase,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 15,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Don't have an account ?  ",
            style: AppLoginButtonFonts.loginText,
          ),
          GestureDetector(
            onTap: () => useCase.redirectToSignUp(),
            child: Text(
              "Sign up",
              style: AppLoginButtonFonts.loginTextUnderline,
            ),
          )
        ],
      ),
    );
  }
}
