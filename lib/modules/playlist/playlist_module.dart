import 'package:berna_libary/commons/domain/entities/core_playlist.dart';
import 'package:berna_libary/modules/playlist/presenters/pages/playlist_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PlaylistModule extends Module {
  static const String moduleRoute = "/playlists/";

  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, args) => PlaylistPage(
            playlist: args.data as CorePlaylist,
          ),
        )
      ];
}
