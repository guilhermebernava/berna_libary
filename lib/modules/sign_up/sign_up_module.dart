import 'package:berna_libary/modules/sign_up/presenters/sign_up_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SignUpModule extends Module {
  static const String moduleRoute = "/create_user/";

  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          "/",
          child: (_, __) => const SignUpPage(),
        )
      ];
}
