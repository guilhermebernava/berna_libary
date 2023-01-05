import 'package:flutter/material.dart';

class FormWithKey extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final List<Widget> children;

  const FormWithKey({
    super.key,
    required this.children,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: children,
      ),
    );
  }
}
