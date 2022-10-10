import 'package:flutter/material.dart';
import 'package:movie_app/Screen/movie_details_widget.dart';
import 'package:movie_app/Screen/movie_list_details/movie_details_provider.dart';
import 'package:provider/provider.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key,required this.id,});
  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.indigo[900],
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.lightGreenAccent,
              semanticLabel: 'Back',
            ),
            onPressed: () => Navigator.pop(context),
          )
        ],
      ),
      body: ChangeNotifierProvider<MovieDetailsProvider>(
        create: (context) => MovieDetailsProvider()..getMovie(id: id),
        child: Consumer<MovieDetailsProvider>(
          builder: (ctx, movieDetailsProvider, _) {
            var myMovie = movieDetailsProvider.movie;
            return (myMovie != null)
                ? MovieDetailsWidget(
                    movie: myMovie,
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ),
      ),
    );
  }
}
