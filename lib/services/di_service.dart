import 'package:dio/dio.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

import 'hive_service.dart';
import 'navigation_service.dart';
import 'user_service.dart';

class DIService {
  static void initialize() {
    GetIt.I.registerSingleton<NavigationServiceMain>(NavigationServiceMain());
    GetIt.I.registerSingleton<FluroRouter>(FluroRouter());
    GetIt.I.registerSingleton<FlutterSecureStorage>(FlutterSecureStorage());
  }

  static void initializeConfig(Dio dio) {
    GetIt.I.registerSingleton<HiveService>(HiveService());
    GetIt.I.registerSingleton<UserService>(UserService());
    GetIt.I.registerSingleton<Dio>(dio);
  }
}
