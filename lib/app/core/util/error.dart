class OnboardingException implements Exception {
  final String message;
  OnboardingException(this.message);
}

class RefreshTokenException implements Exception {
  final String message;
  RefreshTokenException({this.message = ""});
}
