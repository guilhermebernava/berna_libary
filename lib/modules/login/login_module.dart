import 'package:berna_libary/modules/login/domain/use_cases/login_use_case.dart';
import 'package:berna_libary/modules/login/presenters/login_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginModule extends Module {
  static const String moduleRoute = "/login/";

  @override
  List<Bind<Object>> get binds => [
        Bind(
          (i) => LoginUseCase(),
        )
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
