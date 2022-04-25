import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_book/base/base_controller.dart';
import 'package:red_book/data/models/all_users_response.dart';
import 'package:red_book/data/models/new_user_response.dart';
import 'package:red_book/data/models/user_types_response.dart';
import 'package:red_book/data/repository/admin_repository.dart';

import '../../data/models/requests/new_user_request.dart';

class AdminController extends BaseController {
  final AdminRepository _repository = AdminRepository();
  int limit = 100;
  int page = 1;
  List<Users> _users = [];
  List<UserTypes> _userTypes = [];
  int chosenType = -1;
  String name = '';

  final TextEditingController loginController = TextEditingController();
  final FocusNode loginFocus = FocusNode();
  final TextEditingController nameController = TextEditingController();
  final FocusNode nameFocus = FocusNode();
  final TextEditingController passwordController = TextEditingController();
  final FocusNode passwordFocus = FocusNode();

  @override
  void onInit() {
    getAllUsers();
    getUserTypes();
    super.onInit();
  }

  void setType(int index, String s) {
    chosenType = index;
    name = s;
    update();
  }

  void createUser() {
    if (loginController.text.trim().isEmpty) {
      Get.snackbar('Error!', 'Enter login');
      return;
    }
    if (passwordController.text.trim().isEmpty) {
      Get.snackbar('Error!', 'Enter password');
      return;
    }
    if (passwordController.text.trim().length < 8) {
      Get.snackbar('Error!', 'Password is too short!');
      return;
    }

    if (nameController.text.trim().isEmpty) {
      Get.snackbar('Error!', 'Enter full name');
      return;
    }
    if (name.isEmpty) {
      Get.snackbar('Error!', 'Choose user type');
      return;
    }
    final NewUserRequest request = NewUserRequest(
      password: passwordController.text.trim(),
      fullName: nameController.text.trim(),
      login: loginController.text.trim(),
      userTypeId: chosenType,
    );
    Get.back();
    _createUser(request);
  }

  void clear() {
    loginController.clear();
    passwordController.clear();
    nameController.clear();
    chosenType = -1;
    name = '';
    update();
  }

  Future<void> _createUser(NewUserRequest request) async {
    setLoading(true);
    final result = await _repository.createUser(request);
    setLoading(false);
    if (result is NewUserResponse) {
      debugPrint('New user successfully created!!!');
    }
  }

  Future<void> getAllUsers() async {
    setLoading(true);
    final result = await _repository.getAllUsers(
      limit: limit,
      page: page,
    );
    if (result is AllUsersResponse) {
      _users = result.users ?? [];
      update();
    } else {
      showError(result);
    }
    setLoading(false);
  }

  Future<void> getUserTypes() async {
    setLoading(true);
    final result = await _repository.getUserTypes(
      limit: limit,
      page: page,
    );
    if (result is UserTypesResponse) {
      _userTypes = result.userTypes ?? [];
      update();
    } else {
      showError(result);
    }
    setLoading(false);
  }

  List<Users> get users => _users;

  List<UserTypes> get types => _userTypes;
}
