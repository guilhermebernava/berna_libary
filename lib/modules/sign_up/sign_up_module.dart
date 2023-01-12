import 'package:berna_libary/modules/sign_up/domain/use_cases/sign_up_use_case.dart';
import 'package:berna_libary/modules/sign_up/presenters/sign_up_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SignUpModule extends Module {
  static const String moduleRoute = "/create_user/";

  @override
  List<Bind<Object>> get binds => [
        Bind(
          (i) => SignUpUseCase(),
        )
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          "/",
          child: (_, __) => SignUpPage(
            useCase: Modular.get<SignUpUseCase>(),
          ),
        )
      ];
}
