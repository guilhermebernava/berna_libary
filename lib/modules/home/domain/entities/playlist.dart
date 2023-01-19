import 'package:berna_libary/commons/services/navigate_services.dart';
import 'package:berna_libary/modules/home/domain/enums/e_playlist_type.dart';

class Playlist {
  String name;
  String image;
  String author;
  String route;
  EPlaylistType type;
  //TODO adicionar musicas

  Playlist({
    required this.image,
    required this.name,
    required this.route,
    this.type = EPlaylistType.music,
    this.author = "",
  });

  String get authorType => "$author - ${type.name}";

  void redirectTo(bool withReturn) {
    if (withReturn) {
      NavigateServices.navigateWithReturn(route);
      return;
    }
    NavigateServices.navigateRouteOutlet(route);
  }
}
