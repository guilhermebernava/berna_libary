import 'package:berna_libary/design/colors/app_colors.dart';
import 'package:berna_libary/design/fonts/app_login_button_fonts.dart';
import 'package:berna_libary/modules/login/domain/interfaces/i_login_use_case.dart';
import 'package:berna_libary/modules/login/presenters/widgets/login_button/widgets/login_text_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
  final ValueNotifier<bool> hasError = ValueNotifier(false);
  late Widget _child;
  Color _color = AppColors.primary;

//WIDGETS
  final textButton = Text(
    "LOGIN",
    style: AppLoginButtonFonts.loginButton,
  );
  final loading = const CircularProgressIndicator(
    color: AppColors.white,
    strokeWidth: 4,
  );
  final error = const Icon(
    FontAwesomeIcons.x,
    size: 30,
    color: AppColors.white,
  );

  void _changeError() {
    if (mounted) {
      setState(() {
        hasError.value = !hasError.value;
      });
    }
  }

  void _changeColor() {
    if (mounted) {
      if (hasError.value) {
        _color = AppColors.red;
      } else {
        _color = AppColors.primary;
      }
    }
  }

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
    _child = textButton;

    hasError.addListener(() async {
      if (mounted && hasError.value) {
        _changeColor();
        _child = error;
        await Future.delayed(const Duration(milliseconds: 1500), () {
          _changeError();
          _changeColor();
          _child = textButton;
        });
      }
    });

    isLoading.addListener(() {
      if (mounted) {
        setState(() {
          _child = isLoading.value ? loading : textButton;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    isLoading.dispose();
    hasError.dispose();
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
            onTap: isLoading.value || hasError.value
                ? () {}
                : () async {
                    _changeLoading();
                    widget.useCase.validateFormInputs().then((value) {
                      _changeLoading();
                      if (value != null && value == false) {
                        _changeError();
                        return;
                      }
                    });
                  },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              width: isLoading.value ? 70 : widget.size.width,
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  color: _color,
                  borderRadius: BorderRadius.circular(
                    100,
                  ),
                ),
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 800),
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
