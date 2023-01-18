import 'package:berna_libary/modules/home/presenters/home_main_page.dart';
import 'package:berna_libary/modules/home/presenters/pages/home_page.dart';
import 'package:berna_libary/modules/home/presenters/pages/playlist_page.dart';
import 'package:berna_libary/modules/home/presenters/pages/search_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  static const String moduleRoute = "/home/";

  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, __) => const HomeMainPage(),
          children: [
            ChildRoute(
              HomePage.route,
              child: (_, __) => const HomePage(),
            ),
            ChildRoute(
              SearchPage.route,
              child: (_, __) => const SearchPage(),
            ),
            ChildRoute(
              PlaylistPage.route,
              child: (_, __) => const PlaylistPage(),
            ),
          ],
        )
      ];
}
