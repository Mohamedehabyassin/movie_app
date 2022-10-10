import 'package:flutter/material.dart';
import 'package:movie_app/Data/movie_details_request.dart';

import '../../Model/movie_details.dart';

class MovieDetailsProvider extends ChangeNotifier {
  final MovieDetailsRequest _movieDetailsRequest = MovieDetailsRequest();
   MovieDetails? movie;


  void getMovie({required id}) {
    _movieDetailsRequest.fetchMovie(id).then((value) {
      movie = value;
      notifyListeners();
    });
  }
}
