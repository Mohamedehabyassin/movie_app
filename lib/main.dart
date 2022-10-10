import 'package:flutter/material.dart';
import 'package:movie_app/Screen/home.dart';
import 'package:movie_app/Screen/movie_list/movie_list.dart';
import 'package:movie_app/Screen/movie_list_details/movie_details_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: '/',
        routes: {
          '/movie': (context) => const MovieList(),
         // '/details': (context) =>  const MovieDetailsScreen()
        },
        debugShowCheckedModeBanner: false,
        title: 'Movie App',
        home: const MyHomePage());
  }
}
