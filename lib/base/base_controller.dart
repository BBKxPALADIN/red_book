import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/theme/app_colors.dart';
import '../data/source/local_source.dart';

abstract class BaseController extends GetxController {
  bool _isLoading = false;
  LocalSource localSource = LocalSource.instance;

  void setLoading(bool value) {
    _isLoading = value;
    update();
  }

  void showError(result,
      {String error = 'error', String message = 'undefined_error'}) {
    Get.snackbar(
      result?.status ?? error.tr,
      result?.description ?? message.tr,
      backgroundColor: AppColors.error,
      margin: EdgeInsets.zero,
      colorText: AppColors.white,
      borderRadius: 0,
    );
  }

  void showWarring(
    result, {
    String error = 'attention',
    String message = 'must',
  }) {
    Get.snackbar(
      result?.serverMessage ?? error.tr,
      result?.message ?? message.tr,
      backgroundColor: AppColors.warring,
      margin: EdgeInsets.zero,
      colorText: AppColors.white,
      borderRadius: 0,
    );
  }

  bool get isLoading => _isLoading;
}
