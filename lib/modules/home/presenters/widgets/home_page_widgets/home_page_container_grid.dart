import 'package:berna_libary/commons/services/navigate_services.dart';
import 'package:berna_libary/modules/home/domain/entities/playlist.dart';
import 'package:berna_libary/modules/home/presenters/pages/playlist_page.dart';
import 'package:berna_libary/modules/home/presenters/widgets/home_page_widgets/home_page_container.dart';
import 'package:flutter/material.dart';

class HomePageContainerGrid extends StatelessWidget {
  final Size size;
  final List<Playlist> playlists;

  const HomePageContainerGrid({
    super.key,
    required this.size,
    required this.playlists,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: playlists.length,
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 15,
        ),
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3,
        ),
        itemBuilder: (_, index) => HomePageContainer(
          onTap: () {
            NavigateServices.navigateRouteOutlet(PlaylistPage.route);
          },
          size: size,
          playlist: playlists[index],
        ),
      ),
    );
  }
}
