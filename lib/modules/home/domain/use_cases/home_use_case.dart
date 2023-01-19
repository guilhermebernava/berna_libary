import 'package:berna_libary/modules/home/domain/interfaces/i_home_use_case.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeUseCase implements IHomeUseCase {
  @override
  String settingsRoute;

  HomeUseCase({required this.settingsRoute});

  @override
  void redirectToSettings() {
    Modular.to.pushNamed(settingsRoute);
  }

  @override
  String get welcomeText {
    final hour = DateTime.now().hour;

    if (hour > 6 && hour < 13) {
      return "Good Morning";
    } else if (hour > 13 && hour < 18) {
      return "Good Afternoon";
    } else if (hour > 18) {
      return "Good Evening";
    }

    return "Good something";
  }
}
