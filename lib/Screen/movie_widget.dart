import 'package:flutter/material.dart';
import 'package:movie_app/Model/movie.dart';
import 'package:movie_app/Screen/movie_list_details/movie_details_screen.dart';

class MovieWidget extends StatelessWidget {
  const MovieWidget({super.key, required this.movie});

  final Result movie;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MovieDetailsScreen(id: movie.id)));
        },
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
          padding: const EdgeInsets.all(12),
          height: MediaQuery.of(context).size.height / 4,
          decoration: BoxDecoration(
              color: Colors.blue[100], borderRadius: BorderRadius.circular(25)),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            SizedBox(
              height: double.infinity,
              width: MediaQuery.of(context).size.width / 3,
              child: Image.network(
                'https://image.tmdb.org/t/p/w500/${movie.backdropPath}',
                fit: BoxFit.fitHeight,
              ),
            ),
            const SizedBox(width: 18),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  movie.title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 5),
                Text('( ${movie.releaseDate!.year} )'),
                Wrap(
                    children: movie.genreIds
                        .map((e) => Chip(
                              label: Text('$e'),
                            ))
                        .toList()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(child: Text('${movie.originalLanguage}')),
                    Text(
                      '${movie.voteAverage}',
                      style: const TextStyle(fontWeight: FontWeight.w900),
                    ),
                    const Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                  ],
                ),
              ],
            )),
          ]),
        ));
  }
}
