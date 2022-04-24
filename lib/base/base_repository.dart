import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translator/translator.dart';

import '../core/theme/app_colors.dart';
import 'base_functions.dart';

abstract class BaseRepository {
  final translator = GoogleTranslator();
  // final ApiClient apiClient = ApiClient.getInstance();

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

  Future<String> getErrorMessage(String message) async {
    String description = '';
    switch (message) {
      case "Connection timeout":
        description = 'Время соединения вышло';
        break;
      case "Something wrong":
        description =
            'Что-то не так. Проверьте свое интернет-соединение, несмотря ни на что.';
        break;
      default:
        try {
          await translator
              .translate(
                message,
                from: 'en',
                to: Get.locale?.languageCode ??
                    BaseFunctions.getDefaultLocale(),
              )
              .then((value) => description = value.text);
        } catch (e) {
          description = message;
        }
    }
    return description;
  }
}
