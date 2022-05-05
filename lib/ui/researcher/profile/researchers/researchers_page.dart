import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';

class ResearchersPage extends StatelessWidget {
  const ResearchersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyMain,
      appBar: AppBar(
        title: Text(
          'All Researchers',
          style: AppTextStyles.appName.copyWith(fontSize: 25),
        ),
      ),
      body: Container(),
    );
  }
}
