import 'package:base_mobile_indieapps/utils/enums.dart';

import 'meta.dart';

class ResponseOfRequest<T> extends BaseResponse<T> {
  /// Constructor that able to use attribute parent
  ResponseOfRequest({String? message, Meta? meta, T? data, this.statusCode})
      : super(data: data, message: message, meta: meta);

  /// Getter the status code of the response.
  int? statusCode;
}

/// Base class for all the response API, with generic data type on [data].
class BaseResponse<T> {
  /// Base constructor for all casted response.
  BaseResponse({
    this.data,
    this.status,
    this.meta,
    this.message,
  });

  /// Success response state
  factory BaseResponse.success(T data) {
    return BaseResponse<T>(data: data, status: ResponseStatus.success);
  }

  /// Success response state
  factory BaseResponse.failure(String? message) {
    return BaseResponse<T>(message: message, status: ResponseStatus.failure);
  }

  /// Getter the response status success, failure
  ResponseStatus? status;

  /// Getter the response message.
  String? message;

  /// Getter the response meta, for meta List.
  Meta? meta;

  /// Getter the response data.
  T? data;
}

