import '../models/error_response.dart';

class ResponseHandler {
  dynamic data;
  ErrorResponse? error;

  ResponseHandler.setException(ErrorResponse error) {
    error = error;
  }

  ResponseHandler.fromJson(dynamic json) {
    data = json['data'];
  }
}
