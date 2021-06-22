import 'dart:io';

import 'package:base_mobile_indieapps/services/di_service.dart';
import 'package:base_mobile_indieapps/services/hive_service.dart';
import 'package:base_mobile_indieapps/utils/constant.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

class MainRepository {
  Future _isLoggedIn() async {
    final secureStorage = GetIt.I<FlutterSecureStorage>();

    final token = await secureStorage.read(key: kToken);

    return token != null;
  }

  Future<bool> setConfig(String lang) async {
    Dio dio = _setupDio(lang);
    DIService.initializeConfig(dio);
    await GetIt.I<HiveService>().openBoxPersonal();

    return await _isLoggedIn();
  }

  Dio _setupDio(String lang) {
    BaseOptions options = BaseOptions(
        baseUrl: FlavorConfig.instance!.variables!["baseUrl"],
        connectTimeout: 8000,
        receiveTimeout: 8000,
        sendTimeout: 8000,
        headers: {
          'accept': 'application/json',
          'X-Localization': lang,
        });

    Dio dio = Dio(options);

    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

    dio.interceptors.add(LogInterceptor(
      responseBody: true,
      error: true,
      request: true,
      requestBody: true,
      // requestHeader: true,
      // responseHeader: true,
    ));

    return dio;
  }
}
