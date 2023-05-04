class Validator {
  static WeatherValidateCode cityValidator(String value) {
    RegExp validCity = RegExp(r'[!@#<>?":_`~;.,[\]\\/|=+)(*&^%0-9]');

    if (value.trim().isEmpty) {
      return WeatherValidateCode.emptyCityName;
    } else if (validCity.hasMatch(value.trim())) {
      return WeatherValidateCode.invalidCityName;
    } else {
      return WeatherValidateCode.validCityName;
    }
  }
}

enum WeatherValidateCode { validCityName, emptyCityName, invalidCityName }
