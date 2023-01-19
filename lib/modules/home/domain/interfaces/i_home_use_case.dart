abstract class IHomeUseCase {
  final String settingsRoute;

  String get welcomeText;

  IHomeUseCase({
    required this.settingsRoute,
  });

  void redirectToSettings();
}
