import 'package:flutter/material.dart';
import 'package:netflix_clone/bloc/MovieBloc.dart';
import 'package:netflix_clone/models/Movie.dart';

final movieBloc = MovieBloc();
const String imageUrl = 'https://image.tmdb.org/t/p/original';

class MovieScreen extends StatefulWidget {
  static String id = 'movie_screen';

  const MovieScreen({Key? key}) : super(key: key);

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    movieBloc.getMovie(id: movieBloc.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<Movie>(
        stream: movieBloc.movie$,
        builder: (context, snapshot) {
          print('snapshot3: ${snapshot.hasData}');
          if (snapshot.hasData) {
            print('snapshot1: ${snapshot.data}');
            return Scaffold(
              appBar: AppBar(
                centerTitle: false,
                //backgroundColor: Colors.transparent,
                backgroundColor: const Color(0x44000000),
                elevation: 0,
              ),
              body: Column(
                children: [
                  Image.network(
                      '$imageUrl${snapshot.data?.posterPath}',height: 300,width:MediaQuery.of(context).size.width,),
                ],
              )
            );
          } else {
            print('snapshot2: ${snapshot.connectionState}');
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
