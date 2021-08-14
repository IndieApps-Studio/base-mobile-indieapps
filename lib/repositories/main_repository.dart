import 'package:base_mobile_indieapps/services/di_service.dart';
import 'package:base_mobile_indieapps/services/hive_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:get_it/get_it.dart';

/// Used to initialize the application in splashscreen
class MainRepository {
  /// The method is used to initialize the Application
  /// Setup the DI container, Dio, Hive and etc.
  Future<void> setup() async {
    final dio = _setupDio('id');

    DIService.initializeConfig(dio);

    await GetIt.I<HiveService>().init();
    await GetIt.I<HiveService>().openBoxes();
  }

  Dio _setupDio(String lang) {
    final headers = {
      'accept': 'application/json',
      'X-Localization': lang,
    };
    final options = BaseOptions(
      baseUrl: FlavorConfig.instance.variables["baseUrl"] as String,
      connectTimeout: 8000,
      receiveTimeout: 8000,
      sendTimeout: 8000,
      headers: headers,
    );

    final dio = Dio(options);

    dio.interceptors.add(LogInterceptor(responseBody: true));

    return dio;
  }
}
