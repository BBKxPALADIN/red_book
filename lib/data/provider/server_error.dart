import 'package:dio/dio.dart' hide Headers;

import '../models/error_response.dart';

class ServerError implements Exception {
  String _description = '';
  String? _status;
  int? _statusCode;

  ServerError.withError({required DioError error}) {
    _handleError(error);
  }

  String? getErrorStatus() => _status;

  int? getErrorCode() => _statusCode;

  String getErrorMessage() => _description;

  ErrorResponse getError() =>
      ErrorResponse(description: _description, status: _status);

  _handleError(DioError error) {
    _statusCode = error.response?.statusCode ?? 500;
    switch (error.type) {
      case DioErrorType.connectTimeout:
        _description = "Connection timeout";
        break;
      case DioErrorType.sendTimeout:
        _description = "Connection timeout";
        break;
      case DioErrorType.receiveTimeout:
        _description = "Connection timeout";
        break;
      case DioErrorType.response:
        {
          if (error.response?.data['Error'] is Map<String, dynamic>) {
            _description =
                error.response!.data['Error']['description'].toString();
            _status = error.response!.data['Error']['status'].toString();
          } else {
            _description = error.response!.data['description'].toString();
            _status = error.response!.data['status'].toString();
          }
          break;
        }
      case DioErrorType.cancel:
        _description = "Canceled";
        _status = "Faild";
        break;
      case DioErrorType.other:
        _description = "Something wrong";
        _status = "Faild";

        break;
    }
    return _description;
  }
}
