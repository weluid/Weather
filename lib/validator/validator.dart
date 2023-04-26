class Validator {
  static String cityValidator(String value) {
    late String message;
    // Empty
    if (value.trim().isEmpty) {
      message = 'Please enter city name';
    }
    //Short
    if (value.trim().isNotEmpty && value.trim().length < 4) {
      message = 'Minimum character length is 4';
    }
    // Invalid
    RegExp validCity = RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]');
    if (validCity.hasMatch(value.trim())) {
      message = "Invalid city name";
    }
    if (!validCity.hasMatch(value.trim()) && value.trim().length > 3) {
      message = 'Valid city name. Yey!';
    }
    return message;
  }
}
