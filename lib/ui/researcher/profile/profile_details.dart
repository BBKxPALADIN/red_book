import 'package:flutter/material.dart';
import 'package:red_book/core/theme/app_colors.dart';

import '../../../core/theme/app_text_style.dart';
class ProfileDetailsPage extends StatelessWidget {
  const ProfileDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyMain,
      appBar: AppBar(
        title: Text(
          'Personal Info',
          style: AppTextStyles.appName.copyWith(fontSize: 25),
        ),
      ),
      body: Container(),
    );
  }
}
