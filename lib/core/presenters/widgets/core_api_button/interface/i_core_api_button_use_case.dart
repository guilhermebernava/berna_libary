import 'package:berna_libary/core/presenters/widgets/core_api_button/widgets/core_api_button_correct.dart';
import 'package:berna_libary/core/presenters/widgets/core_api_button/widgets/core_api_button_error.dart';
import 'package:berna_libary/core/presenters/widgets/core_api_button/widgets/core_api_button_text.dart';
import 'package:berna_libary/core/presenters/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

abstract class ICoreApiButtonUseCase implements Disposable {
  final ValueNotifier<bool> isLoading;
  final ValueNotifier<bool> hasError;
  final ValueNotifier<bool> isCorrect;
  final CoreApiButtonText textButton;
  final LoadingWidget loading;
  final CoreApiButtonError error;
  final CoreApiButtonCorrect correct;
  Widget child;
  Color color;
  final void Function(void Function() fn) setState;

  ICoreApiButtonUseCase({
    required this.child,
    required this.color,
    required this.hasError,
    required this.isLoading,
    required this.correct,
    required this.error,
    required this.loading,
    required this.textButton,
    required this.isCorrect,
    required this.setState,
  });

  void changeColor(bool isMounted);
  void changeLoading(bool isMounted);
  void changeError(bool isMounted);
  void changeCorrect(bool isMounted);
}
