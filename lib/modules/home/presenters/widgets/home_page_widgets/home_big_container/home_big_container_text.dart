import 'package:berna_libary/modules/home/design/app_home_fonts.dart';
import 'package:flutter/material.dart';

class HomeBigContainerText extends StatelessWidget {
  final Size size;
  final String text;
  final bool isBold;

  const HomeBigContainerText({
    super.key,
    required this.size,
    required this.text,
    this.isBold = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: isBold
          ? const EdgeInsets.symmetric(vertical: 6)
          : const EdgeInsets.only(bottom: 6),
      child: SizedBox(
        width: size.width * 0.35,
        child: Text(
          text,
          textAlign: TextAlign.start,
          style: isBold
              ? AppHomeFonts.homeBigContainer
              : AppHomeFonts.homeBigContainerLight,
        ),
      ),
    );
  }
}
