class AppRegex {
  static String formatWithCommas(int number) {
    return number.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    );
  }

  // ---------------- EMAIL ----------------
  static bool isEmailValid(String email) {
    return RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    ).hasMatch(email);
  }

  // ---------------- FULL PASSWORD VALIDATION ----------------
  static bool isPasswordValid(String password) {
    return RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*.,?"]).{8,}$',
    ).hasMatch(password);
  }

  // ---------------- INDIVIDUAL PASSWORD CHECKS ----------------
  static bool hasLowerCase(String password) {
    return RegExp(r'^(?=.*[a-z])').hasMatch(password);
  }

  static bool hasUpperCase(String password) {
    return RegExp(r'^(?=.*[A-Z])').hasMatch(password);
  }

  static bool hasNumber(String password) {
    return RegExp(r'^(?=.*\d)').hasMatch(password);
  }

  static bool hasSpecialCharacter(String password) {
    return RegExp(r'^(?=.*[!@#$%^&*.,?""])').hasMatch(password);
  }

  static bool hasMinLength(String password) {
    return RegExp(r'^.{8,}$').hasMatch(password);
  }

  // ---------------- EGYPTIAN PHONE NUMBER ----------------
  static bool isEgyptianPhoneValid(String phone) {
    return RegExp(
      r'^(\+20|0020|0D)(10|11|12|15)\d{8}$',
    ).hasMatch(phone);
  }
}
