import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:red_book/core/theme/app_colors.dart';
import 'package:red_book/data/source/local_source.dart';
import 'package:red_book/ui/researcher/profile/profile_page.dart';
import 'package:red_book/ui/visitor/all_animals_page.dart';
import 'all_researches_page.dart';
import 'confirmations_page.dart';
import 'create_research_page.dart';

class ResearcherMainPage extends StatefulWidget {
  const ResearcherMainPage({Key? key}) : super(key: key);

  @override
  State<ResearcherMainPage> createState() => _ResearcherMainPageState();
}

class _ResearcherMainPageState extends State<ResearcherMainPage> {
  int selectedPos = 0;
  late CircularBottomNavigationController _navigationController;
  List<TabItem> tabItems = List.of([
    TabItem(
      Icons.home,
      "All Researches",
      AppColors.assets,
      labelStyle: const TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.normal,
        color: AppColors.assets,
      ),
    ),
    TabItem(
      Icons.layers,
      "Confirmations",
      AppColors.assets,
      labelStyle: const TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.normal,
        color: AppColors.assets,
      ),
    ),
    TabItem(
      Icons.menu_book,
      "All Animals",
      AppColors.assets,
      labelStyle: const TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.normal,
        color: AppColors.assets,
      ),
    ),
    TabItem(
      Icons.add_circle_outline_outlined,
      "Create Research",
      AppColors.assets,
      labelStyle: const TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.normal,
        color: AppColors.assets,
      ),
    ),
    TabItem(
      Icons.person,
      "Profile",
      AppColors.assets,
      labelStyle: const TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.normal,
        color: AppColors.assets,
      ),
    ),
  ]);

  double bottomNavBarHeight = 50;
  late String userType;

  @override
  void initState() {
    super.initState();
    _navigationController = CircularBottomNavigationController(selectedPos);
    userType = LocalSource.instance.getUserType();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _navigationController.value,
        children: const [
          AllResearchesPage(),
          ConfirmationsPage(),
          AllAnimalsPage(),
          CreateResearchPage(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: CircularBottomNavigation(
          tabItems,
          iconsSize: 23,
          circleSize: 50,
          controller: _navigationController,
          barHeight: bottomNavBarHeight,
          barBackgroundColor: Colors.white,
          animationDuration: const Duration(milliseconds: 300),
          selectedCallback: (int? selectedPos) {
            setState(() {
              this.selectedPos = selectedPos ?? 0;
              debugPrint(_navigationController.value.toString());
            });
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _navigationController.dispose();
  }
}
