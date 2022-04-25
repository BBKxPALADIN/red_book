import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:red_book/base/base_repository.dart';
import '../models/auth_response.dart';
import '../models/requests/auth_request.dart';
import '../provider/api_client.dart';
import '../provider/server_error.dart';

class AuthRepository extends BaseRepository{
  final ApiClient _apiClient = ApiClient.getInstance();
  Future<dynamic> login(AuthRequest request) async {
    try {
      final response = await _apiClient.loginRequest(request);
      return AuthResponse.fromJson(response.data);
    } catch (e,s) {
      debugPrint("Exception occurred: $e stacktrace: $s");
      showError(ServerError.withError(error: e as DioError).getError());
    }
  }
}