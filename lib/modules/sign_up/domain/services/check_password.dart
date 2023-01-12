class CheckPasswordServices {
  static bool confirmPassword(
      {required String password, required String confirmPassword}) {
    if (password == confirmPassword) {
      return true;
    }
    return false;
  }
}
