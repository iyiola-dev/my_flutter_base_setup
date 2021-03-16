class Validator {
  static String? validateEmail(String value) {
    Pattern pattern = r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
    RegExp regex = new RegExp(pattern as String);
    if (!regex.hasMatch(value))
      return 'Please enter a valid email address.';
    else
      return null;
  }

  static String? validateDropDefaultData(value) {
    if (value == null)
      return 'Please select an item.';
    else
      return null;
  }

  static String? validatePassword(String value) {
    Pattern pattern = r'^.{6,}$';
    RegExp regex = new RegExp(pattern as String);
    if (!regex.hasMatch(value))
      return 'Password must be at least 6 characters.';
    else
      return null;
  }

  static String? validateName(String value) {
    // Pattern pattern = r'^.{2,}$';
    // RegExp regex = new RegExp(pattern);
    if (value.length < 1)
      return '🚩 Please enter a name.';
    else
      return null;
  }

  static String? validateText(String value) {
    // Pattern pattern = r'^.{2,}$';
    // RegExp regex = new RegExp(pattern);
    if (value.length < 1)
      return '🚩 Text is too short.';
    else
      return null;
  }

  static String? validateAddress(String value) {
    if (value.length < 1)
      return '🚩 Address is too short';
    else
      return null;
  }

  static String? validateNumber(String value) {
    // Pattern pattern = r'^\D?(\d{3})\D?\D?(\d{3})\D?(\d{4})$';
    // RegExp regex = new RegExp(pattern);

    // if (!regex.hasMatch(value))
    //   return 'Please enter a number.';
    // else
    //   return null;
    if (value.length < 1)
      return '🚩 Please enter a number.';
    else
      return null;
  }

  static String? validateMonth(String value) {
    if (int.parse(value) > 12) {
      return '🚩 Please a valid month.';
    }
    if (value.length < 2)
      return '🚩 Please enter a number.';
    else
      return null;
  }

  static String? validatePhoneNumber(String value) {
    // Pattern pattern = r'^\D?(\d{3})\D?\D?(\d{3})\D?(\d{4})$';
    // RegExp regex = new RegExp(pattern);

    // if (!regex.hasMatch(value))
    //   return 'Please enter a number.';
    // else
    //   return null;
    if (value.length < 5)
      return '🚩 Phone number not valid.';
    else
      return null;
  }

  static String? validateCardNumber(String value) {
    // Pattern pattern = r'^\D?(\d{3})\D?\D?(\d{3})\D?(\d{4})$';
    // RegExp regex = new RegExp(pattern);

    // if (!regex.hasMatch(value))
    //   return 'Please enter a number.';
    // else
    //   return null;
    if (value.length < 16)
      return '🚩 Please enter a a valid card number.';
    else
      return null;
  }

  static String? validateAmount(String value) {
    Pattern pattern = r'(?!^0*$)(?!^0*\.0*$)^\d{1,15}(\.\d{1,2})?$';
    // Pattern pattern = r'^[0-9]+';
    RegExp regex = new RegExp(pattern as String);
    if (!regex.hasMatch(value))
      return '🚩 Please enter valid amount.';
    else
      return null;
  }
}
