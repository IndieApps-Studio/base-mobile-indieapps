import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:base_mobile_indieapps/models/base_response.dart';
import 'package:base_mobile_indieapps/models/meta.dart';
import 'package:base_mobile_indieapps/services/user_service.dart';
import 'package:base_mobile_indieapps/utils/typedef.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:retry/retry.dart';

import 'package:base_mobile_indieapps/helper/exception_helper.dart';

class BaseRepository {
  final Dio _dio = GetIt.I<Dio>();
  final _userService = GetIt.I<UserService>();

  Future<ResponseOfRequestMap> get(String api,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final token = await _userService.checkUserToken();

      final Map<String, dynamic> headers = {};
      if (token != null) headers['Authorization'] = 'Bearer $token';

      final response = await retry(
        () => _dio.get<MapString>(
          api,
          queryParameters: queryParameters,
          options: Options(responseType: ResponseType.json, headers: headers),
        ),
        retryIf: (e) => e is SocketException || e is TimeoutException,
      );

      final hasMeta = response.data?.containsKey('meta') ?? false;

      return ResponseOfRequest(
        data: response.data,
        statusCode: response.statusCode,
        meta:
            hasMeta ? Meta.fromJson(response.data!['meta'] as MapString) : null,
      );
    } on DioError catch (e) {
      return ExceptionHelper(e).catchException();
    }
  }

  Future<ResponseOfRequestMap> post(
    String api, {
    Map<String, dynamic>? data,
  }) async {
    try {
      final token = await _userService.checkUserToken();

      final Map<String, dynamic> headers = {};
      if (token != null) headers['Authorization'] = 'Bearer $token';

      final response = await retry(
        () => _dio.post<MapString>(
          api,
          data: json.encode(data),
          options: Options(responseType: ResponseType.json, headers: headers),
        ),
        retryIf: (e) => e is SocketException || e is TimeoutException,
      );

      final hasMessage = response.data?.containsKey('message') ?? false;

      return ResponseOfRequest(
        data: response.data,
        statusCode: response.statusCode,
        message: hasMessage ? response.data!['message'] as String : null,
      );
    } on DioError catch (e) {
      return ExceptionHelper(e).catchException();
    }
  }

  Future<ResponseOfRequestMap> put(String api,
      {Map<String, dynamic>? data,
      Map<String, dynamic>? queryParameters}) async {
    try {
      final token = await _userService.checkUserToken();

      final Map<String, dynamic> headers = {};
      if (token != null) headers['Authorization'] = 'Bearer $token';

      final response = await retry(
        () => _dio.put<MapString>(
          api,
          data: json.encode(data),
          queryParameters: queryParameters,
          options: Options(headers: headers),
        ),
        retryIf: (e) => e is SocketException || e is TimeoutException,
      );

      final hasMessage = response.data?.containsKey('message') ?? false;

      return ResponseOfRequest(
        data: response.data,
        statusCode: response.statusCode,
        message: hasMessage ? response.data!['message'] as String : null,
      );
    } on DioError catch (e) {
      return ExceptionHelper(e).catchException();
    }
  }
}
