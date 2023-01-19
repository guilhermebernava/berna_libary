import 'package:berna_libary/modules/settings/presenters/settings_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SettingsModule extends Module {
  static const String moduleRoute = "/settings/";

  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, __) => const SettingsPage(),
        )
      ];
}
