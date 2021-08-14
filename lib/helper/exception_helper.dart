import 'dart:io';

import 'package:base_mobile_indieapps/utils/constant.dart';
import 'package:base_mobile_indieapps/utils/toast.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'package:base_mobile_indieapps/services/navigation_service.dart';
import 'package:base_mobile_indieapps/utils/typedef.dart';

class ExceptionHelper<T> {
  final DioError _e;
  ExceptionHelper(this._e);

  Future<ResponseOfRequestMap> catchException() async {
    String message = '';

    switch (_e.type) {
      case DioErrorType.connectTimeout:
        message = kMessageConnectionTimeout;
        break;
      case DioErrorType.sendTimeout:
        message = kMessageConnectionTimeout;
        break;
      case DioErrorType.receiveTimeout:
        message = kMessageConnectionTimeout;
        break;
      case DioErrorType.response:
        final response = _e.response;

        if (response == null) {
          message = kMessageConnectionTimeout;
        } else if (response.statusCode == 401) {
          await GetIt.I<NavigationServiceMain>().pushRemoveAllRoutes('/login');
          return ResponseOfRequestMap(statusCode: response.statusCode);
        } else if (response.statusCode == 422) {
          final data = response.data as MapString;

          if (data.isNotEmpty) {
            final errors = Map<String, List>.from(data['errors'] as Map);
            final errorMessages = List<String>.from(errors[errors.keys.first]!);

            if (errorMessages.isNotEmpty) {
              message = errorMessages.first;
            }
          }
        }
        break;
      case DioErrorType.cancel:
        message = kMessageException;
        break;
      case DioErrorType.other:
        if (_e.error is SocketException) {
          message = kMessageNoConnection;
        } else {
          message = _e.message;
        }
        break;
    }

    showToastError(message);

    final data = _e.response?.data as MapString;
    return ResponseOfRequestMap(
      data: data,
      message: message,
      statusCode: _e.response?.statusCode,
    );
  }
}
