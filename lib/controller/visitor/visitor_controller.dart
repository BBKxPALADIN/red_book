import 'package:red_book/base/base_controller.dart';
import 'package:red_book/data/repository/visitor_repository.dart';

import '../../data/models/all_animals_response.dart';

class VisitorController extends BaseController {
  final VisitorRepository _repository = VisitorRepository();
  int limit = 100;
  int page = 1;
  String search = '';
  List<Creatures> _creatures = [];

  @override
  void onInit() {
    getAllAnimals();
    super.onInit();
  }

  Future<void> getAllAnimals() async {
    setLoading(true);
    final result = await _repository.getAllAnimals(
      limit: limit,
      page: page,
      search: search,
    );
    if (result is AllAnimalsResponse) {
      _creatures = result.creatures ?? [];
      update();
    } else {
      showError(result);
    }
    setLoading(false);
  }

  List<Creatures> get creatures => _creatures;
}
