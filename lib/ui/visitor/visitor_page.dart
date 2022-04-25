import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:red_book/core/theme/app_colors.dart';
import 'package:red_book/data/source/local_source.dart';
import 'package:red_book/ui/auth/login_page.dart';
import 'package:red_book/ui/visitor/visit_animals_page.dart';
import 'all_animals_page.dart';

class VisitorPage extends StatefulWidget {
  const VisitorPage({Key? key}) : super(key: key);

  @override
  State<VisitorPage> createState() => _VisitorPageState();
}

class _VisitorPageState extends State<VisitorPage> {
  int selectedPos = 0;
  late CircularBottomNavigationController _navigationController;
  List<TabItem> tabItems = List.of([
    TabItem(
      Icons.home,
      "All Animals",
      AppColors.assets,
      labelStyle: const TextStyle(
        fontWeight: FontWeight.normal,
        color: AppColors.assets,
      ),
    ),
    TabItem(
      Icons.layers,
      "Visit Animals",
      AppColors.assets,
      labelStyle: const TextStyle(
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
        children: [
          const AllAnimalsPage(),
          userType.isNotEmpty ? const VisitAnimalsPage() : const AuthPage(),
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
