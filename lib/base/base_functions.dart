import 'dart:io';

import '../data/provider/server_error.dart';

class BaseFunctions {
  BaseFunctions._();

  static String screenValue = '';

  static bool checkIsCancelled(ServerError? value) {
    return (value?.getErrorMessage() ?? '') != 'Canceled';
  }

  static String getDefaultLocale() {
    final String defaultSystemLocale = Platform.localeName;
    switch (defaultSystemLocale.split("_").first) {
      case "ru":
        return "ru";
      case "en":
        return "en";
      case "uz":
        return "uz";
      default:
        return "ru";
    }
  }
}
