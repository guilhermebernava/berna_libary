import 'package:berna_libary/core/presenters/widgets/core_api_button/core_api_button.dart';
import 'package:berna_libary/core/presenters/widgets/core_back_button/core_back_button.dart';
import 'package:berna_libary/core/presenters/widgets/core_text_field/core_text_field.dart';
import 'package:berna_libary/core/presenters/widgets/form_with_key/form_with_key.dart';
import 'package:berna_libary/core/services/validate_services/validate_services.dart';
import 'package:berna_libary/modules/recover_password/domain/interfaces/i_recover_password_use_case.dart';
import 'package:berna_libary/modules/recover_password/presenters/widgets/recover_password_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RecoverEmailPage extends StatelessWidget {
  static const route = "/recover-email";

  final IRecoverPasswordUseCase useCase;

  const RecoverEmailPage({
    super.key,
    required this.useCase,
  });

  @override
  Widget build(BuildContext context) {
    useCase.clearEmail();
    final Size size = MediaQuery.of(context).size;
    final key = GlobalKey<FormState>();

    return RecoverPasswordBackground(
      child: FormWithKey(
        mainAxisAlignment: MainAxisAlignment.start,
        formKey: key,
        children: [
          CoreBackButton(
            size: size,
            onTap: () => Modular.to.navigate(useCase.loginRoute),
          ),
          SizedBox(
            height: size.height * 0.25,
          ),
          CoreTextField(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
            title: "Email",
            obscureText: false,
            hintText: "teste@teste.com",
            onChanged: (value) => useCase.model.email(value),
            validator: (_) => useCase.model.email.validator(),
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          CoreApiButton(
            size: size,
            route: useCase.loginRoute,
            text: "Send Token to Email",
            onTap: () async => await useCase.changePassword(key, context).then(
                  (string) => ValidateServices.validateFutureString(
                    string,
                    context,
                  ),
                ),
          ),
        ],
      ),
    );
  }
}
