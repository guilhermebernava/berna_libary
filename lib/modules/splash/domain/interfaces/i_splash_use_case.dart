abstract class ISplashUseCase {
  final String routeTo;

  ISplashUseCase({
    required this.routeTo,
  });

  void redirectToNextPage();
}
