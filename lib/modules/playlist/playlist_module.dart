import 'package:berna_libary/commons/domain/entities/core_playlist.dart';
import 'package:berna_libary/modules/playlist/blocs/music_bloc/music_bloc.dart';
import 'package:berna_libary/modules/playlist/presenters/pages/music_page.dart';
import 'package:berna_libary/modules/playlist/presenters/pages/playlist_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';

class PlaylistModule extends Module {
  static const String moduleRoute = "/playlists/";

  @override
  List<Bind<Object>> get binds => [
        BlocBind.singleton(
          (i) => MusicBloc(),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, args) => PlaylistPage(
            playlist: args.data as CorePlaylist,
          ),
        ),
        ChildRoute(
          MusicPage.route,
          child: (_, args) => MusicPage(
            audioPlayer: args.data,
          ),
        )
      ];
}
