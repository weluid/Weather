import 'package:weather/repositories/managers/base_manager.dart';
import 'package:weather/repositories/managers/dio_manager.dart';
import 'package:weather/repositories/managers/http_manager.dart';

enum Managers { httpManager, dioManager }

extension ManagerUtils on Managers {
  BaseManager getCurrentManager() => this == Managers.httpManager ? HttpManager() : DioManager();
}
