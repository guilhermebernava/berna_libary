import 'package:berna_libary/design/colors/app_colors.dart';
import 'package:berna_libary/design/fonts/app_login_button_fonts.dart';
import 'package:berna_libary/modules/login/domain/interfaces/i_login_use_case.dart';
import 'package:berna_libary/modules/login/presenters/widgets/login_button/widgets/login_text_button.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatefulWidget {
  final Size size;
  final ILoginUseCase useCase;

  const LoginButton({
    super.key,
    required this.useCase,
    required this.size,
  });

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton>
    with TickerProviderStateMixin {
  final ValueNotifier<bool> isLoading = ValueNotifier(false);
  late Widget _child;

  void _changeLoading() {
    if (mounted) {
      setState(() {
        isLoading.value = !isLoading.value;
      });
    }
  }

  @override
  void initState() {
    super.initState();

    _child = Text(
      "LOGIN",
      style: AppLoginButtonFonts.loginButton,
    );

    isLoading.addListener(() {
      setState(() {
        _child = isLoading.value
            ? const CircularProgressIndicator(
                color: AppColors.white,
                strokeWidth: 4,
              )
            : Text(
                "LOGIN",
                style: AppLoginButtonFonts.loginButton,
              );
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    isLoading.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: isLoading.value == true
                ? () {}
                : () {
                    _changeLoading();
                    // widget.useCase.validateFormInputs().then((value) {
                    //   if (mounted) {
                    //     setState(() {
                    //       isLoading = false;
                    //     });
                    //   }
                    // });

                    Future.delayed(const Duration(seconds: 3), () {
                      _changeLoading();
                    });
                  },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width:
                  isLoading.value ? widget.size.width * 0.3 : widget.size.width,
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(
                    100,
                  ),
                ),
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 400),
                  child: _child,
                ),
              ),
            ),
          ),
          LoginTextButton(
            useCase: widget.useCase,
          )
        ],
      ),
    );
  }
}
