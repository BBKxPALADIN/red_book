import 'package:flutter/material.dart';
import 'package:red_book/core/theme/app_colors.dart';

import '../../core/theme/app_text_style.dart';

class AllResearchesPage extends StatelessWidget {
  const AllResearchesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyMain,
      appBar: AppBar(
        title: Text(
          'All researches',
          style: AppTextStyles.appName.copyWith(fontSize: 25),
        ),
      ),
      body: SafeArea(
        child: Container(),
      ),
    );
  }
}
