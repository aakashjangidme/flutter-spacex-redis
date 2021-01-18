import '../../locator.dart';
import '../networking/api_base_helper.dart';
import '../provider/movie_provider.dart';

/// Example class.
class MovieRepository {
  final String _apiKey = 'Paste your api key here';

  final _httpService = locator<HttpService>();

  Future<List<Movie>> fetchMovieList() async {
    // ignore: unused_local_variable
    final response = await _httpService.get('movie/popular?api_key=$_apiKey');
    // return MovieResponse.fromJson(response).results;
    return null;
  }
}
