class Validator {
  static WeatherValidateCode cityValidator(String value) {
    RegExp validCity = RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9]');

    if (value.trim().isEmpty) {
      return WeatherValidateCode.emptyCityName;
    } else if (value.trim().isNotEmpty && value.trim().length < 4) {
      return WeatherValidateCode.notEnoughSymbol;
    } else if (validCity.hasMatch(value.trim())) {
      return WeatherValidateCode.invalidCityName;
    } else {
      return WeatherValidateCode.validCityName;
    }
  }
}

enum WeatherValidateCode { validCityName, emptyCityName, notEnoughSymbol, invalidCityName }
