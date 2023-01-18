class SharedError implements Exception {
  final String error;
  final String repo;

  SharedError({
    required this.error,
    required this.repo,
  });
}
