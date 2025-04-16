class UtilValidator {
  static bool isValidEmail(String login) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(login);
  }

  static bool isValidPassword(String password) {
    return password.length >= 6;
  }
}