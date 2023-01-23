import 'package:berna_libary/commons/domain/entities/core_playlist.dart';
import 'package:berna_libary/commons/domain/entities/music.dart';
import 'package:berna_libary/commons/domain/enums/e_playlist_type.dart';
import 'package:berna_libary/modules/home/design/home_images.dart';

class HomeMockData {
  static final containerPlaylists = <CorePlaylist>[
    CorePlaylist(
      image: HomeImages.lofi1,
      name: "Testes",
      author: "Testando",
      id: '',
      musics: [
        Music(
          image: HomeImages.lofi2,
          name: "1",
          album: "teste",
          duration: "1:25",
          author: "Bernava",
          releaseDate: DateTime.now().add(
            const Duration(days: 10),
          ),
        ),
        Music(
          image: HomeImages.lofi3,
          name: "2",
          album: "testando",
          duration: "4:25",
          author: "Bernava",
          releaseDate: DateTime.now().add(
            const Duration(days: 10),
          ),
        ),
        Music(
          image: HomeImages.lofi4,
          name: "3",
          album: "cleber",
          duration: "8:25",
          author: "Bernava",
          releaseDate: DateTime.now().add(
            const Duration(days: 10),
          ),
        ),
      ],
      type: EPlaylistType.music,
    ),
    CorePlaylist(
      image: HomeImages.lofi2,
      name: "Chill Beats",
      author: "Cleber",
      id: '',
      musics: [],
      type: EPlaylistType.music,
    ),
    CorePlaylist(
      image: HomeImages.lofi3,
      name: "Chill Beats",
      author: "Cleber",
      id: '',
      type: EPlaylistType.music,
      musics: [],
    ),
    CorePlaylist(
      image: HomeImages.lofi4,
      name: "Chill Beats",
      author: "Cleber",
      id: '',
      musics: [],
      type: EPlaylistType.music,
    ),
  ];
}
