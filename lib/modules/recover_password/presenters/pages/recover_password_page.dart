import 'package:berna_libary/modules/recover_password/domain/interfaces/i_recover_password_use_case.dart';
import 'package:berna_libary/modules/recover_password/presenters/pages/recover_email/recover_email.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RecoverPasswordMainPage extends StatefulWidget {
  final IRecoverPasswordUseCase useCase;

  const RecoverPasswordMainPage({
    super.key,
    required this.useCase,
  });

  @override
  State<RecoverPasswordMainPage> createState() =>
      _RecoverPasswordMainPageState();
}

class _RecoverPasswordMainPageState extends State<RecoverPasswordMainPage> {
  @override
  void initState() {
    super.initState();
    Modular.to.navigate(".${RecoverEmailPage.route}");
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: const RouterOutlet(),
      ),
    );
  }
}
