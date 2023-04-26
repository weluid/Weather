import 'package:weather/validator/validator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Empty city test', () {
    String result = Validator.cityValidator('');
    expect(result, 'Please enter city name');
  });

  test('Empty city test2', () {
    String result = Validator.cityValidator('        ');
    expect(result, 'Please enter city name');
  });

  test('Short city name', () {
    String result = Validator.cityValidator('dd');
    expect(result, 'Minimum character length is 4');
  });

  test('Number in name', () {
    String result = Validator.cityValidator('Hello12');
    expect(result, "Invalid city name");
  });

  test('Symbols in name', () {
    String result = Validator.cityValidator('dekovalov@gmail.com');
    expect(result, "Invalid city name");
  });

  test('Valid city', () {
    String result = Validator.cityValidator('Kyiv');
    expect(result, 'Valid city name. Yey!');
  });

  test('Valid city', () {
    String result = Validator.cityValidator('San Francisco');
    expect(result, 'Valid city name. Yey!');
  });
}
