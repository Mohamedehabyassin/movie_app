import 'package:flutter/material.dart';

import '../Model/movie_details.dart';

class MovieDetailsWidget extends StatelessWidget {
  const MovieDetailsWidget({super.key, required this.movie});

  final MovieDetails movie;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(9),
        decoration: BoxDecoration(
          color: Colors.indigo[900],
        ),
        child: ListView(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 12),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              //height: MediaQuery.of(context).size.height / 2.5,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(25)),
                child: Image.network(
                  'https://image.tmdb.org/t/p/w500/${movie.backdropPath}',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 22),
            Text(
              movie.title,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.white, fontSize: 28,),
            ),
            const SizedBox(height: 22),
            Text(
              "( ${movie.tagline} )",
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.white, fontSize: 18,),
            ),
            const SizedBox(height: 22),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:
                   movie.genres.map((e) => Container(margin: const EdgeInsets.all(5),child: Chip(label: Text(e.name)))).toList(),
                  ),
            ),
            const SizedBox(height: 22),
            Text(
              movie.overview,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
            const SizedBox(height: 22),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '${movie.voteAverage?.floorToDouble()}',
                  style: const TextStyle(fontSize: 25, color: Colors.white),
                ),const Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 35,
                ),
              ],
            )
          ],
        ));
  }
}
