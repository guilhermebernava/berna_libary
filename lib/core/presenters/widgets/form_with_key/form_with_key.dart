import 'package:flutter/material.dart';

class FormWithKey extends StatelessWidget {
  final Key formKey;
  final Widget child;

  const FormWithKey({
    super.key,
    required this.child,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: child,
    );
  }
}
