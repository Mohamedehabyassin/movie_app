import 'package:flutter/material.dart';
import 'package:movie_app/Screen/movie_list/movie_list_provider.dart';
import 'package:movie_app/Screen/movie_widget.dart';
import 'package:provider/provider.dart';

class MovieList extends StatelessWidget {
  const MovieList({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MovieListProvider>(
      create: (context) => MovieListProvider()..getMovies(),
      child: Consumer<MovieListProvider>(
        builder: (context, movieListProvider, _) {
          final movie = movieListProvider.movies;

          return (movie.isNotEmpty)
              ? ListView.builder(
                  itemCount: movie.length,
                  itemBuilder: (_, index) {
                    return MovieWidget(movie: movie[index]);
                  })
              : const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
