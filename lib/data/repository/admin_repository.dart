import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:red_book/base/base_repository.dart';
import 'package:red_book/data/models/all_users_response.dart';
import '../models/new_user_response.dart';
import '../models/requests/new_user_request.dart';
import '../models/user_types_response.dart';
import '../provider/api_client.dart';
import '../provider/server_error.dart';

class AdminRepository extends BaseRepository{
  final ApiClient _apiClient = ApiClient.getInstance();
  Future<dynamic> getAllUsers({required int limit, required int page}) async {
    try {
      final response = await _apiClient.getAllUsers(limit,page);
      return AllUsersResponse.fromJson(response.data);
    } catch (e,s) {
      debugPrint("Exception occurred: $e stacktrace: $s");
      showError(ServerError.withError(error: e as DioError).getError());
    }
  }
  Future<dynamic> getUserTypes({required int limit, required int page}) async {
    try {
      final response = await _apiClient.getUserTypes(limit,page);
      return UserTypesResponse.fromJson(response.data);
    } catch (e,s) {
      debugPrint("Exception occurred: $e stacktrace: $s");
      showError(ServerError.withError(error: e as DioError).getError());
    }
  }
  Future<dynamic> createUser(NewUserRequest request) async {
    try {
      final response = await _apiClient.createUserRequest(request);
      return NewUserResponse.fromJson(response.data);
    } catch (e,s) {
      debugPrint("Exception occurred: $e stacktrace: $s");
      showError(ServerError.withError(error: e as DioError).getError());
    }
  }
}