class AuthError implements Exception {
  final String message;
  final String error;

  AuthError({
    required this.error,
    required this.message,
  });
}
