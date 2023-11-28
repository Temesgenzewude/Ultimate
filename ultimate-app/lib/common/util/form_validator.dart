mixin FormValidator {
  static bool validateName(String value) {
    if (value.isEmpty) {
      return false;
    }
    return true;
  }

  static bool validateEmail(String value) {
    if (value.isEmpty) {
      return false;
    }
    // Regex for email validation
    const String p = '[a-zA-Z0-9\+\.\_\%\-\+]{1,256}'
        '\\@'
        '[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}'
        '('
        '\\.'
        '[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}'
        ')+';
    final RegExp regExp = RegExp(p);
    if (regExp.hasMatch(value)) {
      return true;
    }
    return false;
  }

  static bool validatePhoneNumber(String phone) {
    const String pattern = r'(^(\+[0-9]{1,3}[- ]?)?\d{10}$)';
    final RegExp regExp = RegExp(pattern);

    if (!regExp.hasMatch(phone)) {
      print("NOOO");
      return false;
    }
    return true;
  }

  static bool validatePassword(String value) {
    if (value.isEmpty) {
      return false;
    }
    // Use any password length of your choice here
    if (value.length < 5) {
      return false;
    }

    return true;
  }

  static bool isNumeric({String? s}) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  static bool validateBirthDate(String value) {
    // Check if the value is not empty
    if (value.isEmpty) {
      return false;
    }

    // Use a regular expression to validate the date format (MM/DD/YYYY)
    final RegExp regExp = RegExp(r'^\d{2}-\d{2}-\d{4}$');
    if (!regExp.hasMatch(value)) {
      return false;
    }

    // Split the date into components
    final List<String> dateComponents = value.split('-');

    // Extract month, day, and year
    final int month = int.tryParse(dateComponents[0]) ?? 0;
    final int day = int.tryParse(dateComponents[1]) ?? 0;
    final int year = int.tryParse(dateComponents[2]) ?? 0;

    // Validate the month, day, and year ranges
    if (month < 1 || month > 12 || day < 1 || day > 31 || year < 1900) {
      return false;
    }

    // Additional logic for specific date validation if needed

    return true;
  }
}
