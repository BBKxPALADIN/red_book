import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_book/base/base_controller.dart';
import 'package:red_book/data/source/local_source.dart';
import 'package:red_book/ui/researcher/profile/profile_details.dart';
import 'package:red_book/ui/researcher/profile/rank/rank_page.dart';
import 'package:red_book/ui/researcher/profile/researchers/researchers_page.dart';
import '../../data/models/all_researches_response.dart';
import '../../data/models/confirmations_response.dart';
import '../../data/models/creature_type_response.dart';
import '../../data/models/new_research_response.dart';
import '../../data/models/personal_info_response.dart';
import '../../data/models/requests/new_research_request.dart' as r;
import '../../data/models/sub_type_response.dart';
import '../../data/repository/researcher_repository.dart';
import '../../ui/researcher/profile/notification/notification_page.dart';

class ResearcherController extends BaseController {
  final List<String> animalType = ['', '', '', ''];

  final TextEditingController name = TextEditingController();
  final FocusNode nameFocus = FocusNode();
  final TextEditingController remaining = TextEditingController();
  final FocusNode remainingFocus = FocusNode();
  final TextEditingController description = TextEditingController();
  final FocusNode descriptionFocus = FocusNode();
  late PersonalInfoResponse info;
  late AllResearchesResponse all;
  late ConfirmationsResponse confirmations;
  late SubTypeResponse subType;
  late CreatureTypeResponse creatureType;
  List<CreatureSubTypes> _listTypes = [];
  int chosenType = -1;
  String type = '';

  final List<PersonalInfo> list = [
    PersonalInfo(
        'Notifications', const Icon(Icons.notifications, color: Colors.white)),
    PersonalInfo('Profile', const Icon(Icons.person, color: Colors.white)),
    PersonalInfo('All Researchers',
        const Icon(Icons.supervised_user_circle_outlined, color: Colors.white)),
    PersonalInfo('Rank', const Icon(Icons.star_border, color: Colors.white)),
  ];

  final List<Widget> pages = [
    const NotificationPage(),
    const ProfileDetailsPage(),
    const ResearchersPage(),
    const RankPage(),
  ];
  final ResearcherRepository _repository = ResearcherRepository();

  @override
  void onInit() {
    getPersonalInfo();
    getAllResearches();
    getConfirmations();
    getCreatureSubType();
    getCreatureType();
    super.onInit();
  }

  Future<void> getPersonalInfo() async {
    setLoading(true);
    final response =
        await _repository.getResearcherInfo(LocalSource.instance.getUserId());
    setLoading(false);
    if (response is PersonalInfoResponse) {
      info = response;
    }
  }

  Future<void> getAllResearches() async {
    setLoading(true);
    final response = await _repository.getAllResearches(page: 1, limit: 100);
    setLoading(false);
    if (response is AllResearchesResponse) {
      all = response;
    }
  }

  Future<void> getConfirmations() async {
    setLoading(true);
    final response = await _repository.getConfirmations();
    setLoading(false);
    if (response is ConfirmationsResponse) {
      confirmations = response;
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

  Future<void> getCreatureType() async {
    setLoading(true);
    final response = await _repository.getCreatureType();
    setLoading(false);
    if (response is CreatureTypeResponse) {
      creatureType = response;
    }
  }

  void setType(int index, String s) {
    chosenType = index;
    type = s;
    update();
  }

  void createResearch(context) {
    FocusScope.of(context).requestFocus(FocusNode());
    if (name.text.trim().isEmpty) {
      Get.snackbar('Error!', 'Enter animal\'s name');
      return;
    }
    if (remaining.text.trim().isEmpty) {
      Get.snackbar('Error!', 'Enter remaining count');
      return;
    }
    if (description.text.trim().isEmpty) {
      Get.snackbar('Error!', 'Enter some description for animal!');
      return;
    }
    if (type.isEmpty) {
      Get.snackbar('Error!', 'Choose user type');
      return;
    }
    final r.NewResearchRequest request = r.NewResearchRequest(
      creature: r.Creature(
        name: name.text,
        description: description.text,
        remainingCount: int.parse(remaining.text),
        subTypeId: chosenType,
      ),
      userId: LocalSource.instance.getUserId(),
    );
    _createResearch(request);
  }

  void clearFields() {
    name.clear();
    description.clear();
    remaining.clear();
    chosenType = -1;
    type = '';
    update();
  }

  Future<void> _createResearch(r.NewResearchRequest request) async {
    setLoading(true);
    final result = await _repository.createResearch(request);
    setLoading(false);
    if (result is NewResearchResponse) {
      debugPrint('New creature successfully created!!!');
      clearFields();
      Get.snackbar('Congratulations', 'New creature successfully created');
    }
  }

  List<CreatureSubTypes> get listTypes => _listTypes;
}

class PersonalInfo {
  String title;
  Icon image;

  PersonalInfo(this.title, this.image);
}
