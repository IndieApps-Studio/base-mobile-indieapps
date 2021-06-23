import 'dart:io';

import 'package:base_mobile_indieapps/models/base_response.dart';
import 'package:base_mobile_indieapps/utils/constant.dart';
import 'package:base_mobile_indieapps/utils/toast.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart'
    hide Options;
import 'package:get_it/get_it.dart';

import '../services/navigation_service.dart';

class ExceptionHelper<T> {
  final DioError e;
  ExceptionHelper(this.e);

  Future<BaseResponse<T>> catchException() async {
    String message = '';
    int statusCode = 0;

    switch (e.type) {
      case DioErrorType.connectTimeout:
        message = kConnectionTimeout;
        statusCode = 500;
        break;
      case DioErrorType.sendTimeout:
        message = kConnectionTimeout;
        statusCode = 500;

        break;
      case DioErrorType.receiveTimeout:
        message = kConnectionTimeout;
        statusCode = 500;

        break;
      case DioErrorType.response:
        if (e.response == null) {
          return BaseResponse(
            message: kErrorCantReachServer,
            statusCode: 0,
          );
        }

        final eResponse = e.response!;
        final statusCode = e.response!.statusCode;

        if (statusCode == 422) {
          Map<String, dynamic> errors = eResponse.data['data'];

          message = eResponse.data['data'][errors.keys.first][0] ??
              eResponse.data['message'];
        } else if (statusCode == 401) {
          message = eResponse.data['message'] ?? kErrorException;

          if (eResponse.data['error'] is String) {
            message = eResponse.data['error'];
          } else if (eResponse.data['message'] != null) {
            message = eResponse.data['message'];
          }

          if (eResponse.requestOptions.path != '/v1/auth/login') {
             if (kDebugMode) {
              showToastError(message);
            }

            await GetIt.I<FlutterSecureStorage>().deleteAll();
            await GetIt.I<NavigationServiceMain>().pushRemoveUntil('/login');
           
            return BaseResponse(
              message: message,
              statusCode: statusCode,
              data: eResponse.data,
            );
          }
        }
        break;
      case DioErrorType.cancel:
        message = kErrorException;
        statusCode = 500;

        break;
      case DioErrorType.other:
        if (e.error is SocketException) {
          message = kNoInternetConnection;
        } else {
          message = e.message;
        }
        statusCode = 500;

        break;
    }
    return BaseResponse(
      message: message,
      statusCode: statusCode,
      data: e.response?.data,
    );
  }
}
