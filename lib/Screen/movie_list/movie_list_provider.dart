import 'package:flutter/material.dart';
import 'package:movie_app/Data/movie_request.dart';
import 'package:movie_app/Model/movie.dart';

class MovieListProvider extends ChangeNotifier {
  final MovieRequest _movieRequest = MovieRequest();
  List<Result> movies = [];

  void getMovies() {
    _movieRequest.fetchData().then((list) {
      movies = list!;
      notifyListeners();
    });
  }
}
