import 'package:red_book/base/base_controller.dart';
import 'package:red_book/data/models/all_users_response.dart';
import 'package:red_book/data/repository/admin_repository.dart';

class AdminController extends BaseController {
  final AdminRepository _repository = AdminRepository();
  int limit = 100;
  int page = 1;
  List<Users> _users = [];

  @override
  void onInit() {
    getAllUsers();
    super.onInit();
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

  List<Users> get users => _users;
}
