import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:red_book/base/base_repository.dart';
import 'package:red_book/data/models/creature_type_response.dart';
import 'package:red_book/data/models/personal_info_response.dart';
import 'package:red_book/data/models/sub_type_response.dart';
import '../models/all_researches_response.dart';
import '../models/new_research_response.dart';
import '../models/requests/confirmation_request.dart';
import '../provider/api_client.dart';
import '../provider/server_error.dart';

class ConfirmerRepository extends BaseRepository {
  final ApiClient _apiClient = ApiClient.getInstance();

  Future<dynamic> getConfirmerInfo(int id) async {
    try {
      final response = await _apiClient.getPersonalInfo(id);
      return PersonalInfoResponse.fromJson(response.data);
    } catch (e, s) {
      debugPrint("Exception occurred: $e stacktrace: $s");
      showError(ServerError.withError(error: e as DioError).getError());
    }
  }

  Future<dynamic> getAllResearches(
      {required int limit, required int page,required int subType}) async {
    try {
      final response = await _apiClient.getResearchesByType(limit, page,subType);
      return AllResearchesResponse.fromJson(response.data);
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

  Future<dynamic> confirmationRequest(ConfirmationRequest request) async {
    try {
      final response = await _apiClient.confirmationRequest(request);
      return NewResearchResponse.fromJson(response.data);
    } catch (e, s) {
      debugPrint("Exception occurred: $e stacktrace: $s");
      showError(ServerError.withError(error: e as DioError).getError());
    }
  }
}
