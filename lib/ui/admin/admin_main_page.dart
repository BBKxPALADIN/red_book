import 'package:flutter/material.dart';
import 'package:red_book/core/theme/app_colors.dart';
import 'package:red_book/core/theme/app_text_style.dart';
import 'package:red_book/core/theme/app_utils.dart';

class AdminMainPage extends StatelessWidget {
  const AdminMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyMain,
      appBar: AppBar(
        title: const Text(
          'Welcome Admin',
          style: AppTextStyles.appBarTitle,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Admin\'s abilities',
            textAlign: TextAlign.start,
            style: AppTextStyles.introTitle,
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              color: AppColors.white,
              borderRadius: AppUtils.kBorderRadius12,
            ),
            child: const Text(
              '',
              style: AppTextStyles.normalBlack415,
            ),
          ),
        ],
      ),
    );
  }
}
