import 'package:flutter/cupertino.dart';

import '../../locator.dart';
import '../networking/api_response.dart';
import '../repositories/dummy_repository.dart';

class MovieProvider extends ChangeNotifier {
  final _movieRepository = locator<MovieRepository>();

  ApiResponse<List<Movie>> _movieList;
  ApiResponse<List<Movie>> get movieList => _movieList;

  MovieProvider() {
    fetchMovieList();
  }

  Future<void> fetchMovieList() async {
    _movieList = ApiResponse.loading('Fetching Popular Movies');
    notifyListeners();

    ///
    try {
      var movies = await _movieRepository.fetchMovieList();
      _movieList = ApiResponse.completed(movies);
      notifyListeners();
    } catch (e) {
      _movieList = ApiResponse.error(e.toString());
      notifyListeners();
    }
  }
}

class Movie {}
