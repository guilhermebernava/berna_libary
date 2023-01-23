import 'package:berna_libary/commons/domain/entities/core_playlist.dart';

abstract class IHomeUseCase {
  final String settingsRoute;
  final String playlistRoute;

  String get welcomeText;

  IHomeUseCase({
    required this.settingsRoute,
    required this.playlistRoute,
  });

  void redirectToSettings();
  void redirectToPlaylist(CorePlaylist corePlaylist);
}
