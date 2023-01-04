import 'package:berna_libary/core/domain/interfaces/services/i_themes_services.dart';
import 'package:berna_libary/core/presenters/widgets/core_text_field/widgets/obscure_text_widget.dart';
import 'package:berna_libary/core/services/themes_services.dart';
import 'package:berna_libary/design/colors/app_colors.dart';
import 'package:berna_libary/design/fonts/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CoreTextField extends StatefulWidget {
  final String title;
  final String? initialValue;
  final TextEditingController? controller;
  final List<TextInputFormatter>? formatters;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final int maxLines;
  final bool obscureText;

  const CoreTextField({
    super.key,
    required this.title,
    this.initialValue,
    this.controller,
    this.formatters,
    this.validator,
    this.keyboardType,
    this.maxLines = 1,
    this.obscureText = false,
  });

  @override
  State<CoreTextField> createState() => _CoreTextFieldState();
}

class _CoreTextFieldState extends State<CoreTextField> {
  late bool isHidden;
  late IThemesServices themesServices;

  @override
  void initState() {
    super.initState();
    isHidden = widget.obscureText;
    themesServices = Modular.get<ThemesServices>();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Login",
          style: AppFonts.basicFont,
        ),
        TextFormField(
          initialValue: widget.initialValue,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: widget.controller,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 2,
                color: themesServices.isDarkTheme(context)
                    ? AppColors.white
                    : AppColors.black,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            suffixIcon: ObscureTextWidget(
              onTap: () => setState(() {
                isHidden = !isHidden;
              }),
              isShow: widget.obscureText,
              isHidden: isHidden,
            ),
          ),
          inputFormatters: widget.formatters,
          validator: widget.validator,
          keyboardType: widget.keyboardType,
          maxLines: widget.maxLines,
          style: AppFonts.basicFont,
          obscureText: isHidden,
        ),
      ],
    );
  }
}
