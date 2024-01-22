class Validator {
  Validator._();

  static String? validateBasic(String? value) {
    if (value != null && value.isEmpty) {
      return "This field can not be empty.";
    }
    return null;
  }

  static String? validateEmail(String? value) {
    final condition = RegExp(
        r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?");

    validateBasic(value);

    if (value != null && !condition.hasMatch(value)) {
      return 'Enter a valid e-mail.';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    final condition =
        RegExp(r"^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$");

    validateBasic(value);

    if (value != null && !condition.hasMatch(value)) {
      return "Enter a valid password.";
    }
    return null;
  }
}
