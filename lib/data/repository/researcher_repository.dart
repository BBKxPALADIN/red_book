import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:red_book/base/base_repository.dart';
import 'package:red_book/data/models/all_researches_response.dart';
import 'package:red_book/data/models/confirmations_response.dart';
import 'package:red_book/data/models/creature_type_response.dart';
import 'package:red_book/data/models/personal_info_response.dart';
import 'package:red_book/data/models/sub_type_response.dart';

import '../models/new_research_response.dart';
import '../models/requests/new_research_request.dart';
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

  Future<dynamic> getConfirmations() async {
    try {
      final response = await _apiClient.getConfirmations();
      return ConfirmationsResponse.fromJson(response.data);
    } catch (e, s) {
      debugPrint("Exception occurred: $e stacktrace: $s");
      showError(ServerError.withError(error: e as DioError).getError());
    }
  }

  Future<dynamic> getCreatureSubType() async {
    try {
      final response = await _apiClient.getCreatureSubType();
      return SubTypeResponse.fromJson(response.data);
    } catch (e, s) {
      debugPrint("Exception occurred: $e stacktrace: $s");
      showError(ServerError.withError(error: e as DioError).getError());
    }
  }

  Future<dynamic> getCreatureType() async {
    try {
      final response = await _apiClient.getCreatureType();
      return CreatureTypeResponse.fromJson(response.data);
    } catch (e, s) {
      debugPrint("Exception occurred: $e stacktrace: $s");
      showError(ServerError.withError(error: e as DioError).getError());
    }
  }

  Future<dynamic> createResearch(NewResearchRequest request) async {
    try {
      final response = await _apiClient.createResearch(request);
      return NewResearchResponse.fromJson(response.data);
    } catch (e, s) {
      debugPrint("Exception occurred: $e stacktrace: $s");
      showError(ServerError.withError(error: e as DioError).getError());
    }
  }
}
