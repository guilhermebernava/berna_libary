import 'package:berna_libary/commons/services/navigate_services.dart';
import 'package:berna_libary/modules/home/design/home_images.dart';
import 'package:berna_libary/modules/home/presenters/pages/playlist_page.dart';
import 'package:berna_libary/modules/home/presenters/widgets/home_page_widgets/home_page_container.dart';
import 'package:flutter/material.dart';

class HomePageContainerGrid extends StatelessWidget {
  final Size size;

  const HomePageContainerGrid({
    super.key,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      child: GridView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 15,
        ),
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3,
        ),
        children: [
          HomePageContainer(
            onTap: () {
              NavigateServices.navigateRouteOutlet(PlaylistPage.route);
            },
            size: size,
            text: "Liked Songs",
          ),
          HomePageContainer(
            onTap: () {},
            size: size,
            imageAsset: HomeImages.lofi1,
            text: "Lofi Beats",
          ),
          HomePageContainer(
            onTap: () {},
            size: size,
            imageAsset: HomeImages.lofi2,
            text: "Relax and Study",
          ),
          HomePageContainer(
            onTap: () {},
            size: size,
            imageAsset: HomeImages.lofi3,
            text: "Vibes",
          ),
          HomePageContainer(
            onTap: () {},
            size: size,
            imageAsset: HomeImages.lofi4,
            text: "Chil Beats",
          ),
          HomePageContainer(
            onTap: () {},
            size: size,
            imageAsset: HomeImages.lofi5,
            text: "My Favorites",
          ),
        ],
      ),
    );
  }
}
