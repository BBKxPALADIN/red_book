import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:red_book/base/base_repository.dart';
import 'package:red_book/data/models/all_researches_response.dart';
import 'package:red_book/data/models/personal_info_response.dart';

import '../provider/api_client.dart';
import '../provider/server_error.dart';

class ResearcherRepository extends BaseRepository {
  final ApiClient _apiClient = ApiClient.getInstance();

  Future<dynamic> getAllResearches(
      {required int limit, required int page}) async {
    try {
      final response = await _apiClient.getAllResearches(limit, page);
      return AllResearchesResponse.fromJson(response.data);
    } catch (e, s) {
      debugPrint("Exception occurred: $e stacktrace: $s");
      showError(ServerError.withError(error: e as DioError).getError());
    }
  }

  Future<dynamic> getUserResearches({
    required int limit,
    required int page,
    required int subTypeId,
    required int userId,
  }) async {
    try {
      final response = await _apiClient.getUserResearches(
        limit,
        page,
        subTypeId,
        userId,
      );
      return AllResearchesResponse.fromJson(response.data);
    } catch (e, s) {
      debugPrint("Exception occurred: $e stacktrace: $s");
      showError(ServerError.withError(error: e as DioError).getError());
    }
  }

  Future<dynamic> getResearcherInfo(int id) async {
    try {
      final response = await _apiClient.getPersonalInfo(id);
      return PersonalInfoResponse.fromJson(response.data);
    } catch (e, s) {
      debugPrint("Exception occurred: $e stacktrace: $s");
      showError(ServerError.withError(error: e as DioError).getError());
    }
  }
}
