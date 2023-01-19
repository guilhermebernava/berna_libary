import 'package:berna_libary/modules/home/domain/interfaces/i_home_use_case.dart';
import 'package:berna_libary/modules/home/mock/playlists.dart';
import 'package:berna_libary/modules/home/presenters/widgets/home_page_widgets/home_app_bar.dart';
import 'package:berna_libary/modules/home/presenters/widgets/home_page_widgets/home_big_containers.dart';
import 'package:berna_libary/modules/home/presenters/widgets/home_page_widgets/home_page_container_grid.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final IHomeUseCase useCase;

  const HomePage({
    super.key,
    required this.useCase,
  });

  static const route = "/home";

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            HomeAppBar(
              useCase: useCase,
              size: size,
            ),
            HomePageContainerGrid(
              size: size,
              playlists: HomeMockData.playlists,
            ),
            HomeBigContainers(
              size: size,
              title: "My Playlists",
              playlists: HomeMockData.containerPlaylists,
            ),
            HomeBigContainers(
              size: size,
              title: "My Playlists",
              playlists: HomeMockData.containerPlaylists,
            ),
            HomeBigContainers(
              size: size,
              title: "My Playlists",
              playlists: HomeMockData.containerPlaylists,
            )
          ],
        ),
      ),
    );
  }
}
