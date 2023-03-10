import 'package:berna_libary/commons/presenters/widgets/core_api_button/interface/i_core_api_button_use_case.dart';
import 'package:berna_libary/commons/presenters/widgets/core_api_button/widgets/core_api_button_error.dart';
import 'package:berna_libary/commons/presenters/widgets/core_api_button/widgets/core_api_button_text.dart';
import 'package:berna_libary/commons/presenters/widgets/loading_widget.dart';
import 'package:berna_libary/design/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../widgets/core_api_button_correct.dart';

class CoreApiButtonUseCase implements ICoreApiButtonUseCase, Disposable {
  @override
  final CoreApiButtonCorrect correct = const CoreApiButtonCorrect();
  @override
  final CoreApiButtonError error = const CoreApiButtonError();
  @override
  final LoadingWidget loading = const LoadingWidget();
  @override
  late final CoreApiButtonText textButton;
  @override
  late Widget child;
  @override
  late Color color;
  @override
  ValueNotifier<bool> hasError = ValueNotifier(false);
  @override
  ValueNotifier<bool> isCorrect = ValueNotifier(false);
  @override
  ValueNotifier<bool> isLoading = ValueNotifier(false);
  @override
  void Function(void Function() fn) setState;

  CoreApiButtonUseCase({
    required this.setState,
    required String text,
  }) {
    textButton = CoreApiButtonText(text: text);
    child = textButton;
    color = AppColors.primary;
  }

  @override
  void changeColor(bool isMounted) {
    if (isMounted) {
      if (hasError.value) {
        color = AppColors.red;
      } else if (isCorrect.value) {
        color = AppColors.green;
      } else {
        color = AppColors.primary;
      }
      setState(() {});
    }
  }

  @override
  void changeCorrect(bool isMounted) {
    if (isMounted) {
      setState(() {
        isCorrect.value = !isCorrect.value;
      });
    }
  }

  @override
  void changeError(bool isMounted) {
    if (isMounted) {
      setState(() {
        hasError.value = !hasError.value;
      });
    }
  }

  @override
  void changeLoading(bool isMounted) {
    if (isMounted) {
      setState(() {
        isLoading.value = !isLoading.value;
      });
    }
  }

  @override
  void dispose() {
    isLoading.dispose();
    isCorrect.dispose();
    hasError.dispose();
  }
}
