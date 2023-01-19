import 'package:berna_libary/modules/home/design/home_images.dart';
import 'package:berna_libary/modules/home/domain/entities/playlist.dart';
import 'package:berna_libary/modules/home/presenters/pages/search_page.dart';

class HomeMockData {
  static final containerPlaylists = <Playlist>[
    Playlist(
      image: HomeImages.lofi1,
      name: "Chill Beats",
      author: "Cleber",
      route: SearchPage.route,
    ),
    Playlist(
      image: HomeImages.lofi2,
      name: "My Favorites",
      author: "DGM ZZ",
      route: SearchPage.route,
    ),
    Playlist(
      image: HomeImages.lofi3,
      name: "Relax and Study",
      author: "Bernava",
      route: SearchPage.route,
    ),
    Playlist(
      image: HomeImages.lofi4,
      name: "Vibes",
      author: "ABC 0099",
      route: SearchPage.route,
    ),
    Playlist(
      image: HomeImages.lofi5,
      name: "Lofi Beats",
      author: "GUILHERME B",
      route: SearchPage.route,
    )
  ];

  static final playlists = <Playlist>[
    Playlist(
      image: HomeImages.likedSongs,
      name: "Liked Songs",
      route: SearchPage.route,
    ),
    Playlist(
      image: HomeImages.lofi1,
      name: "Chill Beats",
      route: SearchPage.route,
    ),
    Playlist(
      image: HomeImages.lofi2,
      name: "My Favorites",
      route: SearchPage.route,
    ),
    Playlist(
      image: HomeImages.lofi3,
      name: "Relax and Study",
      route: SearchPage.route,
    ),
    Playlist(
      image: HomeImages.lofi4,
      name: "Vibes",
      route: SearchPage.route,
    ),
    Playlist(
      image: HomeImages.lofi5,
      name: "Lofi Beats",
      route: SearchPage.route,
    )
  ];
}
