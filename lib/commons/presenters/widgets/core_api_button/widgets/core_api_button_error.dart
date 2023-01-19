import 'package:berna_libary/design/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CoreApiButtonError extends StatelessWidget {
  const CoreApiButtonError({super.key});

  @override
  Widget build(BuildContext context) {
    return const Icon(
      FontAwesomeIcons.x,
      size: 30,
      color: AppColors.white,
    );
  }
}
