import 'package:flutter/material.dart';
import 'package:red_book/base/base_controller.dart';
import 'package:red_book/data/source/local_source.dart';
import 'package:red_book/ui/researcher/profile/profile_details.dart';
import 'package:red_book/ui/researcher/profile/rank/rank_page.dart';
import 'package:red_book/ui/researcher/profile/researchers/researchers_page.dart';

import '../../data/models/all_researches_response.dart';
import '../../data/models/personal_info_response.dart';
import '../../data/repository/researcher_repository.dart';
import '../../ui/researcher/profile/notification/notification_page.dart';

class ResearcherController extends BaseController {
  final List<String> animalType = ['', '', '', ''];

  final TextEditingController name = TextEditingController();
  final TextEditingController remaining = TextEditingController();
  final TextEditingController description = TextEditingController();
  late PersonalInfoResponse info;
  late AllResearchesResponse all;

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
}

class PersonalInfo {
  String title;
  Icon image;

  PersonalInfo(this.title, this.image);
}
