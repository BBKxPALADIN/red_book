import 'package:dio/dio.dart' hide Headers;

import '../models/error_response.dart';

class ServerError implements Exception {
  String _message = '';
  int? _code;
  int? _statusCode;

  ServerError.withError({required DioError error}) {
    _handleError(error);
  }

  int? getErrorStatus() => _code;

  int? getErrorCode() => _statusCode;

  String getErrorMessage() => _message;

  ErrorResponse getError() =>
      ErrorResponse(code: _code, message: _message);

  _handleError(DioError error) {
    _statusCode = error.response?.statusCode ?? 500;
    switch (error.type) {
      case DioErrorType.connectTimeout:
        _message = "Connection timeout";
        break;
      case DioErrorType.sendTimeout:
        _message = "Connection timeout";
        break;
      case DioErrorType.receiveTimeout:
        _message = "Connection timeout";
        break;
      case DioErrorType.response:
        {
          if (error.response?.data['Error'] is Map<String, dynamic>) {
            _message =
                error.response!.data['Error']['message'].toString();
            _code = error.response!.data['Error']['code'];
          } else {
            _message = error.response!.data['message'].toString();
            _code = error.response!.data['code'];
          }
          break;
        }
      case DioErrorType.cancel:
        _message = "Canceled";
        _code = 600;
        break;
      case DioErrorType.other:
        _message = "Something wrong";
        _code = 600;

        break;
    }
    return _message;
  }
}
