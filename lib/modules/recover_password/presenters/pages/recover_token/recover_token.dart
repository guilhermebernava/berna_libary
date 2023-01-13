import 'package:berna_libary/core/presenters/widgets/core_api_button/core_api_button.dart';
import 'package:berna_libary/core/presenters/widgets/core_back_button/core_back_button.dart';
import 'package:berna_libary/core/presenters/widgets/core_text_field/core_text_field.dart';
import 'package:berna_libary/core/presenters/widgets/form_with_key/form_with_key.dart';
import 'package:berna_libary/core/services/snackbar/snackbar_services.dart';
import 'package:berna_libary/modules/recover_password/domain/interfaces/i_recover_password_use_case.dart';
import 'package:berna_libary/modules/recover_password/presenters/pages/recover_email/recover_email.dart';
import 'package:berna_libary/modules/recover_password/presenters/widgets/recover_password_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RecoverTokenPage extends StatelessWidget {
  static const route = "/recover-token";

  final IRecoverPasswordUseCase useCase;

  const RecoverTokenPage({
    super.key,
    required this.useCase,
  });

  @override
  Widget build(BuildContext context) {
    useCase.clearToken();
    final size = MediaQuery.of(context).size;
    final key = GlobalKey<FormState>();

    return RecoverPasswordBackground(
      child: FormWithKey(
        mainAxisAlignment: MainAxisAlignment.start,
        formKey: key,
        children: [
          CoreBackButton(
            size: size,
            onTap: () => Modular.to.navigate(".${RecoverEmailPage.route}"),
          ),
          SizedBox(
            height: size.height * 0.25,
          ),
          CoreTextField(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
            title: "Token",
            obscureText: false,
            hintText: "EXAMPLE123",
            onChanged: (value) => useCase.model.token(value),
            validator: (_) => useCase.model.token.validator(),
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          CoreApiButton(
            text: "Validate Token",
            onTap: () async => await useCase.validateToken(key).then((value) {
              if (value != null && value == false) {
                SnackbarServices.showErrorSnackbar(
                  context,
                  "invalid token",
                );
                return false;
              }
              return true;
            }),
            size: size,
          ),
        ],
      ),
    );
  }
}
