import 'package:tesla_redis/src/core/constants/api_routes.dart';
import 'package:tesla_redis/src/core/models/rocket.dart';

import '../../locator.dart';
import '../networking/api_base_helper.dart';

/// Example class.
class RocketsRepository {
  final _httpService = locator<HttpService>();

  Future<List<RocketResponse>> fetchRocketsList() async {
    final List response = await _httpService.get(ApiRoutes.rockets);
    return response.map((k) => RocketResponse.fromJson(k)).toList();
  }
}
