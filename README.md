# Weather App
---
A weather app created with Flutter and Dart and using API from [OpenWeatherMap]:

#### Functionality:

- Automatically acquire user current location
- Search for weather by city
- Current weather information
- 5 days weather information
## How to start
---
1. Create an account on [OpenWeatherMap].
2. Then get your API key from https://openweathermap.org/api.
3. Create file `magic.dart` in lib and paste your API key
```dart
const apiKey = 'Paste Your API Key Here';
```
## Tech
---
Libraries & Dependencies

- [Bloc] - makes it easy to separate UI from business logic, making code fast and reusable
- [Flutter Spinkit] - a collection of loading indicators animated with flutter
- [Http] - for making HTTP requests from Dart team
- [Dio] - for making HTTP requests from community team
- [Geolocator] - provides easy access to location services
- [Connectivity Plus] - allows Flutter apps to discover network connectivity
- [Flutter Localization] - provides localization facilities, including message translation
- [Firebase Core] - connecting app to Firebase
- [Firebase Crashlytics] - realtime crash reporter that helps you track, prioritize, and fix errors

## Running tests
---
Open folder **weather/test** and select necessary test
Then press `Ctrl+Shift+10` to start all tests in the selected file

## HTTP request manager
---
##### The app has 2 managers: Http and Dio

Navigate to lib/repositories/weather_api_client.dart if you want to switch between them and change this line by `Manager` values
```dart
final Managers baseManager = Managers.httpManager;
```


##### If you want to add another manager
1. Create new dart file in lib/repositories/manager, like `some_manager`.
2. Create class with extends `BaseManager` class.
3. Override methods with current logic
4. Navigate to lib/repositories/manager/enum_manager and add new manager to enum
```dart 
enum Managers { httpManager, dioManager }
```
5. Add new manager to ManagerUtils extension method



[OpenWeatherMap]: <https://openweathermap.org/>
[Bloc]: <https://pub.dev/packages/flutter_bloc>
[Flutter Spinkit]: <https://pub.dev/packages/flutter_spinkit>
[Http]: <https://pub.dev/packages/http>
[Dio]: <https://pub.dev/packages/dio>
[Geolocator]: <https://pub.dev/packages/geolocator>
[Connectivity Plus]: <https://pub.dev/packages/connectivity_plus>
[Flutter Localization]: <https://pub.dev/packages/flutter_localization>
[Firebase Core]: <https://pub.dev/packages/firebase_core>
[Firebase Crashlytics]: <https://pub.dev/packages/firebase_crashlytics>


![IMG_3140](https://github.com/weluid/Weather/assets/IMG_3140.gif)

