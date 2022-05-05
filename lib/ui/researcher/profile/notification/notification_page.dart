import 'package:flutter/material.dart';
import 'package:red_book/core/theme/app_colors.dart';
import 'package:red_book/ui/researcher/widget/post_item.dart';
import '../../../../core/theme/app_text_style.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyMain,
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: AppTextStyles.appName.copyWith(fontSize: 25),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          PostItem(
            image:
                'https://minutes.co/wp-content/uploads/2019/06/research-and-scholarship.jpg',
            title: 'New Research was accepted',
            body: 'New creature name: Bamboo-dwelling tarantula',
          ),
          SizedBox(height: 16),
          PostItem(
            image:
                'https://media.istockphoto.com/vectors/rejected-ink-stamp-vector-id949546382?k=20&m=949546382&s=612x612&w=0&h=kkKdGas0vbNRIhQGDyv_EnjQs16x8zEi1i9vMoIipjU=',
            title: 'New Research was rejected',
            body: 'This animal type is not on extinction',
          )
        ],
      ),
    );
  }
}
