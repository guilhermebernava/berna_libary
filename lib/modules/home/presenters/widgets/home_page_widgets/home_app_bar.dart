import 'package:berna_libary/modules/home/design/app_home_fonts.dart';
import 'package:berna_libary/modules/home/domain/interfaces/i_home_use_case.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends AppBar {
  HomeAppBar({
    super.key,
    required IHomeUseCase useCase,
    required Size size,
  }) : super(
          centerTitle: false,
          title: Text(
            useCase.welcomeText,
            style: AppHomeFonts.homeAppBar,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: GestureDetector(
                onTap: () => useCase.redirectToSettings(),
                child: const Icon(
                  Icons.settings,
                  size: 25,
                ),
              ),
            ),
          ],
        );
}
