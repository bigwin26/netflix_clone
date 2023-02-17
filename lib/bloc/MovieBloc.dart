import 'package:netflix_clone/models/Movie.dart';
import 'package:rxdart/rxdart.dart';

import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class MovieBloc{
  Movie? _movie;
  int id = 0;
  bool loading = false;

  final _movieSubject = BehaviorSubject<Movie>();

  void getMovie({id}) async {
    var url = Uri.https('api.themoviedb.org', '/3/movie/$id',
        {'api_key': '248a52d680518fd97f6e7be12c21157d', 'language': 'ko'});

    // Await the http get response, then decode the json-formatted response.
    loading = true;
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
      convert.jsonDecode(response.body) as Map<String, dynamic>;
      print('getMovie: ${jsonResponse}.');
      _movie = Movie.fromJson(jsonResponse);
      if(_movie != null) {
        _movieSubject.add(_movie!);
        loading = false;
      }
    } else {
      print('getMovie error: ${response.statusCode}.');
    }
  }

  void setMovieId({movieId}){
    id = movieId;
  }

  Stream<Movie> get movie$ => _movieSubject.stream;
}