import 'package:flutter/material.dart';
import 'package:red_book/core/theme/app_colors.dart';

import '../../core/theme/app_text_style.dart';

class VisitAnimalsPage extends StatelessWidget {
  const VisitAnimalsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyMain,
      appBar: AppBar(
        centerTitle: true,
        leading: const SizedBox(),
        title: const Text(
          'Visit Animals',
          style: AppTextStyles.introTitle,
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
