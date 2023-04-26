import 'package:weather/validator/validator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Empty city test', () {
    WeatherValidateCode result = Validator.cityValidator('');
    expect(result, WeatherValidateCode.emptyCityName);
  });

  test('Empty city test2', () {
    WeatherValidateCode result = Validator.cityValidator('        ');
    expect(result, WeatherValidateCode.emptyCityName);
  });

  test('Short city name', () {
    WeatherValidateCode result = Validator.cityValidator('dd');
    expect(result, WeatherValidateCode.notEnoughSymbol);
  });

  test('Number in name', () {
    WeatherValidateCode result = Validator.cityValidator('Hello12');
    expect(result, WeatherValidateCode.invalidCityName);
  });

  test('Symbols in name', () {
    WeatherValidateCode result = Validator.cityValidator('dekovalov@gmail.com');
    expect(result, WeatherValidateCode.invalidCityName);
  });

  test('Valid city', () {
    WeatherValidateCode result = Validator.cityValidator('Kyiv');
    expect(result, WeatherValidateCode.validCityName);
  });

  test('Valid city2', () {
    WeatherValidateCode result = Validator.cityValidator('San Francisco');
    expect(result, WeatherValidateCode.validCityName);
  });

  test('Valid city3', () {
    WeatherValidateCode result = Validator.cityValidator('Ай-Петрі');
    expect(result, WeatherValidateCode.validCityName);
  });
}
