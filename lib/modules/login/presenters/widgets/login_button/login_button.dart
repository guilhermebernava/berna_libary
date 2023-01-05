import 'package:berna_libary/design/colors/app_colors.dart';
import 'package:berna_libary/design/fonts/app_login_button_fonts.dart';
import 'package:berna_libary/modules/login/domain/interfaces/i_login_use_case.dart';
import 'package:berna_libary/modules/login/presenters/widgets/login_button/widgets/login_text_button.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final ILoginUseCase useCase;

  const LoginButton({
    super.key,
    required this.useCase,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 75,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () async => await useCase.validateFormInputs(),
            child: Container(
              width: 300,
              height: 75,
              decoration: BoxDecoration(
                color: AppColors.darkPrimary,
                borderRadius: BorderRadius.circular(
                  100,
                ),
              ),
              child: Center(
                child: Text(
                  "LOGIN",
                  style: AppLoginButtonFonts.loginButton,
                ),
              ),
            ),
          ),
          LoginTextButton(
            useCase: useCase,
          )
        ],
      ),
    );
  }
}
