import 'package:flutter/material.dart';
import 'package:netflix_clone/bloc/MovieBloc.dart';
import 'package:netflix_clone/models/Movie.dart';

final movieBloc = MovieBloc();

class MovieScreen extends StatefulWidget {
  static String id = 'movie_screen';

  const MovieScreen({Key? key}) : super(key: key);

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: StreamBuilder<Movie>(
          stream: movieBloc.movie$,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text('Movie');
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
