import 'package:berna_libary/commons/presenters/widgets/loading_widget.dart';
import 'package:berna_libary/design/colors/app_colors.dart';
import 'package:flutter/material.dart';

class CoreLoading extends StatelessWidget {
  const CoreLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: LoadingWidget(
        color: AppColors.primary,
      ),
    );
  }
}
