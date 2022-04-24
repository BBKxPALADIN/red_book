import 'package:flutter/material.dart';
import 'package:red_book/core/theme/app_colors.dart';

import '../../core/theme/app_text_style.dart';

class VisitorPage extends StatelessWidget {
  const VisitorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyMain,
      appBar: AppBar(
        title: const Text(
          'Visitor Page',
          style: AppTextStyles.appBarTitle,
        ),
      ),
      body: Container(),
    );
  }
}
