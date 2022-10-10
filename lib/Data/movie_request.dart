import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:movie_app/Model/movie.dart';

class MovieRequest {
  final Uri url = Uri.parse(
      'https://api.themoviedb.org/4/discover/movie?api_key=6557d01ac95a807a036e5e9e325bb3f0&sort_by=popularity.desc');

  Future<List<Result>?> fetchData() async {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var responseList = json.decode(response.body);
      Movie movies = Movie.fromJson(responseList);
      return movies.results;
    } else {
      throw Exception("can't load");
    }
  }
}
