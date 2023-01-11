import 'package:berna_libary/modules/recover_password/presenters/recover_password_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RecoverPasswordModule extends Module {
  static const String moduleRoute = "/recover_password/";

  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          "/",
          child: (_, __) => const RecoverPasswordPage(),
        )
      ];
}
