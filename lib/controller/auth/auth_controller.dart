import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_book/base/base_controller.dart';
import 'package:red_book/data/source/local_source.dart';

import '../../data/models/auth_response.dart';
import '../../data/models/requests/auth_request.dart';
import '../../data/repository/auth_repository.dart';
import '../../routes/app_routes.dart';

class AuthController extends BaseController {
  TextEditingController? loginController;
  TextEditingController? passwordController;

  final AuthRepository _repository = AuthRepository();

  FocusNode loginFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  void onInit() {
    super.onInit();
    loginController = TextEditingController();
    passwordController = TextEditingController();
  }

  void login() {
    if (loginController?.text.trim().isNotEmpty ?? false) {
      if (passwordController?.text.trim().isEmpty ?? true) {
        showError(null, message: 'Enter password');
        return;
      }
      final AuthRequest request = AuthRequest(
        login: loginController!.text.trim(),
        password: passwordController!.text.trim(),
      );
      _login(request);
    } else {
      showError(null, message: 'Incorrect login or password');
    }
  }

  Future<void> _login(AuthRequest request) async {
    setLoading(true);
    final result = await _repository.login(request);
    setLoading(false);
    if (result is AuthResponse) {
      final userType = result.userType ?? '';
      if (userType.isNotEmpty) {
        LocalSource.instance.setUserType(userType);
        update();
      }
      if (userType == 'superadmin') {
        Get.offAndToNamed(AppRoutes.admin);
      } else if (userType == 'researchers') {
        Get.offAndToNamed(AppRoutes.researcher);
      } else if (userType == 'research_confirmers') {
        Get.offAndToNamed(AppRoutes.confirmer);
      } else if (userType == 'visitors') {
        Get.offAndToNamed(AppRoutes.visitor);
      } else {
        Get.snackbar('Not existing login!!!', 'This login does not exist!!!');
      }
    }
  }
}
