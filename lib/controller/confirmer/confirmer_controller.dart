import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_book/base/base_controller.dart';
import 'package:red_book/data/repository/confirmer_repository.dart';

import '../../data/models/all_researches_response.dart';
import '../../data/models/new_research_response.dart';
import '../../data/models/personal_info_response.dart';
import '../../data/models/requests/confirmation_request.dart';
import '../../data/models/sub_type_response.dart';
import '../../data/source/local_source.dart';

class ConfirmerController extends BaseController {
  final ConfirmerRepository _repository = ConfirmerRepository();
  late PersonalInfoResponse info;
  late AllResearchesResponse all;
  List<CreatureSubTypes> _listTypes = [];
  late SubTypeResponse subType;
  bool isConfirmed = false;
  String title = '';
  final List<PersonalInfo> list = [
    PersonalInfo(
        'Notifications', const Icon(Icons.notifications, color: Colors.white)),
    PersonalInfo('Profile', const Icon(Icons.person, color: Colors.white)),
    PersonalInfo('All Researchers',
        const Icon(Icons.supervised_user_circle_outlined, color: Colors.white)),
    PersonalInfo('Rank', const Icon(Icons.star_border, color: Colors.white)),
  ];
  final TextEditingController coins = TextEditingController();
  final FocusNode coinsFocus = FocusNode();
  final TextEditingController comment = TextEditingController();
  final FocusNode commentFocus = FocusNode();

  @override
  void onInit() {
    getPersonalInfo().then((value) => getAllResearches());
    getCreatureSubType();
    super.onInit();
  }

  Future<void> getAllResearches() async {
    setLoading(true);
    final response = await _repository.getAllResearches(
      page: 1,
      limit: 100,
      subType: info.subTypeId ?? 1,
    );
    setLoading(false);
    if (response is AllResearchesResponse) {
      all = response;
    }
  }

  Future<void> getPersonalInfo() async {
    setLoading(true);
    final response =
        await _repository.getConfirmerInfo(LocalSource.instance.getUserId());
    setLoading(false);
    if (response is PersonalInfoResponse) {
      info = response;
    }
  }

  Future<void> getCreatureSubType() async {
    setLoading(true);
    final response = await _repository.getCreatureSubType();
    setLoading(false);
    if (response is SubTypeResponse) {
      _listTypes = response.creatureSubTypes ?? [];
      subType = response;
    }
  }

  void clearFields() {
    coins.clear();
    comment.clear();
    update();
  }

  setConfirmed(bool status, String tit) {
    isConfirmed = status;
    title = tit;
    update();
  }

  Future<void> confirmationRequest(int id) async {
    final ConfirmationRequest request = ConfirmationRequest(
      comment: comment.text,
      coinsAmount: int.parse(coins.text),
      confirmedBy: LocalSource.instance.getUserId(),
      isConfirmed: isConfirmed,
      researchId: id,
    );
    setLoading(true);
    final result = await _repository.confirmationRequest(request);
    setLoading(false);
    if (result is NewResearchResponse) {
      Get.back();
      debugPrint('Confirmed successfully!!!');
      clearFields();
      Get.snackbar('Attention', 'Status changed successfully');
    }
  }
}

class PersonalInfo {
  String title;
  Icon image;

  PersonalInfo(this.title, this.image);
}
