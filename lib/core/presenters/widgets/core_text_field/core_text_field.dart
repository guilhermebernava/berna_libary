import 'package:berna_libary/core/domain/interfaces/services/i_themes_services.dart';
import 'package:berna_libary/core/presenters/widgets/core_text_field/widgets/obscure_text_widget.dart';
import 'package:berna_libary/core/presenters/widgets/core_text_field/widgets/text_form_counter.dart';
import 'package:berna_libary/core/services/themes_services.dart';
import 'package:berna_libary/design/colors/app_colors.dart';
import 'package:berna_libary/design/fonts/app_text_form_field_fonts.dart';
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
  final String? hintText;
  final String? counterText;
  final VoidCallback? onCounterTap;
  final void Function(String)? onChanged;
  final EdgeInsets padding;

  const CoreTextField(
      {super.key,
      required this.title,
      required this.onChanged,
      this.initialValue,
      this.controller,
      this.formatters,
      this.validator,
      this.keyboardType,
      this.hintText,
      this.maxLines = 1,
      this.obscureText = false,
      this.counterText,
      this.onCounterTap,
      this.padding = const EdgeInsets.symmetric(vertical: 5, horizontal: 25)});

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
    const double circular = 15;
    final themeColor =
        themesServices.isDarkTheme(context) ? AppColors.white : AppColors.black;

    return Padding(
      padding: widget.padding,
      child: TextFormField(
        initialValue: widget.initialValue,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: widget.controller,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          errorStyle: AppTextFormFieldsFonts.textformFieldError,
          hintStyle: AppTextFormFieldsFonts.hintTextFont,
          hintText: widget.hintText,
          counter: TextFormCounter(
            counterText: widget.counterText,
            onCounterTap: widget.onCounterTap,
          ),
          labelText: widget.title,
          labelStyle: AppTextFormFieldsFonts.textformFieldTitleFont,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: themeColor,
            ),
            borderRadius: BorderRadius.circular(circular),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 2,
              color: AppColors.red,
            ),
            borderRadius: BorderRadius.circular(circular),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: themeColor,
            ),
            borderRadius: BorderRadius.circular(circular),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: themeColor,
            ),
            borderRadius: BorderRadius.circular(circular),
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
        style: AppTextFormFieldsFonts.textformFieldTextFont,
        obscureText: widget.obscureText ? isHidden : widget.obscureText,
      ),
    );
  }
}
