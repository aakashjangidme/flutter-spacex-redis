import 'package:flutter/cupertino.dart';

import '../../locator.dart';
import '../models/rocket.dart';
import '../networking/api_response.dart';
import '../repositories/rockets_repository.dart';

class RocketsProvider extends ChangeNotifier {
  final _rocketsRepository = locator<RocketsRepository>();

  ApiResponse<List<RocketResponse>> _rocketsList;
  ApiResponse<List<RocketResponse>> get rocketsList => _rocketsList;

  RocketsProvider() {
    fetchRocketsList();
  }

  Future<void> fetchRocketsList() async {
    _rocketsList = ApiResponse.loading('Fetching Rockets');
    notifyListeners();

    ///
    try {
      var rockets = await _rocketsRepository.fetchRocketsList();
      _rocketsList = ApiResponse.completed(rockets);
      notifyListeners();
    } catch (e) {
      _rocketsList = ApiResponse.error(e.toString());
      notifyListeners();
    }
  }
}
