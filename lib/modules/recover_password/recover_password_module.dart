import 'package:berna_libary/modules/login/login_module.dart';
import 'package:berna_libary/modules/recover_password/domain/use_cases/recover_password_use_case.dart';
import 'package:berna_libary/modules/recover_password/presenters/pages/recover_email/recover_email.dart';
import 'package:berna_libary/modules/recover_password/presenters/pages/recover_password_page.dart';
import 'package:berna_libary/modules/recover_password/presenters/pages/recover_token/recover_token.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'presenters/pages/recover_password/recover_password.dart';

class RecoverPasswordModule extends Module {
  static const String moduleRoute = "/recover_password/";

  @override
  List<Bind<Object>> get binds => [
        Bind(
          (i) => RecoverPasswordUseCase(
            loginRoute: LoginModule.moduleRoute,
          ),
        )
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          "/",
          child: (_, __) => RecoverPasswordMainPage(
            useCase: Modular.get<RecoverPasswordUseCase>(),
          ),
          children: [
            ChildRoute(
              RecoverEmailPage.route,
              child: (_, __) => RecoverEmailPage(
                useCase: Modular.get(),
              ),
            ),
            ChildRoute(
              RecoverPasswordPage.route,
              child: (_, __) => RecoverPasswordPage(
                useCase: Modular.get(),
              ),
            ),
            ChildRoute(
              RecoverTokenPage.route,
              child: (_, __) => RecoverTokenPage(
                useCase: Modular.get(),
              ),
            )
          ],
        )
      ];
}
