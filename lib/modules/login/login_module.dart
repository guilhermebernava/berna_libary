import 'package:berna_libary/modules/home/home_module.dart';
import 'package:berna_libary/modules/login/domain/use_cases/login_animate_use_case.dart';
import 'package:berna_libary/modules/login/domain/use_cases/login_use_case.dart';
import 'package:berna_libary/modules/login/presenters/login_page.dart';
import 'package:berna_libary/modules/recover_password/recover_password_module.dart';
import 'package:berna_libary/modules/sign_up/sign_up_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginModule extends Module {
  static const String moduleRoute = "/login/";

  @override
  List<Bind<Object>> get binds => [
        Bind(
          (i) => LoginUseCase(
            homeRoute: HomeModule.moduleRoute,
            recoverPasswordRoute: RecoverPasswordModule.moduleRoute,
            signUpRoute: SignUpModule.moduleRoute,
          ),
        ),
        Bind.factory(
          (i) => LoginAnimateUseCase(),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, __) => LoginPage(
            useCase: Modular.get<LoginUseCase>(),
          ),
        )
      ];
}
