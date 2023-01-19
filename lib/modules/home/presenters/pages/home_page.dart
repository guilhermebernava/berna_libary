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
      appBar: HomeAppBar(
        useCase: useCase,
        size: size,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          HomePageContainerGrid(
            size: size,
            playlists: HomeMockData.playlists,
          ),
          HomeBigContainers(
            size: size,
            playlists: HomeMockData.containerPlaylists,
          )
        ],
      ),
    );
  }
}
