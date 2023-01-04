import 'package:berna_libary/modules/splash/domain/interfaces/i_splash_use_case.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashUseCase implements ISplashUseCase {
  @override
  String routeTo;

  SplashUseCase({
    required this.routeTo,
  });

  @override
  void redirectToNextPage() {
    Modular.to.navigate(routeTo);
  }
}
