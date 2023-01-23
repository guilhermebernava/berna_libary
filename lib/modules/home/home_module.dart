import 'package:berna_libary/modules/home/domain/use_cases/home_use_case.dart';
import 'package:berna_libary/modules/home/presenters/pages/home_main_page.dart';
import 'package:berna_libary/modules/home/presenters/pages/home_page.dart';
import 'package:berna_libary/modules/home/presenters/pages/home_playlists_page.dart';
import 'package:berna_libary/modules/home/presenters/pages/search_page.dart';
import 'package:berna_libary/modules/playlist/playlist_module.dart';
import 'package:berna_libary/modules/settings/settings_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  static const String moduleRoute = "/home/";

  @override
  List<Bind<Object>> get binds => [
        Bind.singleton(
          (i) => HomeUseCase(
            settingsRoute: SettingsModule.moduleRoute,
            playlistRoute: PlaylistModule.moduleRoute,
          ),
        )
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, __) => const HomeMainPage(),
          children: [
            ChildRoute(
              HomePage.route,
              child: (_, __) => HomePage(
                useCase: Modular.get<HomeUseCase>(),
              ),
            ),
            ChildRoute(
              SearchPage.route,
              child: (_, __) => const SearchPage(),
            ),
            ChildRoute(
              HomePlaylistsPage.route,
              child: (_, __) => const HomePlaylistsPage(),
            ),
          ],
        )
      ];
}
