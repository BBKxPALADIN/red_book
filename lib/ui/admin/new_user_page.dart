import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_style.dart';

class NewUserPage extends StatelessWidget {
  const NewUserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyMain,
      appBar: AppBar(
        title: Text(
          'Create New User',
          style: AppTextStyles.appName.copyWith(fontSize: 25),
        ),
      ),
      body: Center(
        child: Text(
          'For Future Work',
          style: AppTextStyles.appBarTitle.copyWith(color: AppColors.assets),
        ),
      ),
    );
  }
}
