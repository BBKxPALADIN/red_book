import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:red_book/base/base_repository.dart';
import '../models/all_animals_response.dart';
import '../provider/api_client.dart';
import '../provider/server_error.dart';

class VisitorRepository extends BaseRepository {
  final ApiClient _apiClient = ApiClient.getInstance();

  Future<dynamic> getAllAnimals(
      {required int limit, required int page, String search = ''}) async {
    try {
     final response = await _apiClient.getAllAnimals(limit, page, search);
     return AllAnimalsResponse.fromJson(response.data);
    } catch (e, s) {
      debugPrint("Exception occurred: $e stacktrace: $s");
      showError(ServerError.withError(error: e as DioError).getError());
    }
  }
}
