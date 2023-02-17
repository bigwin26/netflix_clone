import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/etc/utilities.dart';
import 'package:netflix_clone/models/MovieList.dart';
import 'package:netflix_clone/screens/movie/movie_screen.dart';
import 'package:netflix_clone/styles/constans.dart';

import 'dart:math';

import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

//!!-ListView는 화면밖에 있는 부분은 렌더링을 하지않고, 화면안에 들어오면 렌더링을 하기시작.(성능적으로 유리).
//!!-SingleChildScrollView는 화면밖에 있는 부분도 렌더링함.

const String imageUrl = 'https://image.tmdb.org/t/p/original';

class HomeScreen extends StatefulWidget {
  static String id = 'home_screen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MovieList? _nowPlayList;
  MovieList? _upCommingList;
  Random random = Random();
  int _randomNumber = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNowPlayList();
    getUpcomingPlayList();
  }

  void getNowPlayList() async {
    var url = Uri.https('api.themoviedb.org', '/3/movie/now_playing',
        {'api_key': '248a52d680518fd97f6e7be12c21157d', 'language': 'ko'});

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      print('getNowPlayList status: ${jsonResponse}.');
      _nowPlayList = MovieList.fromJson(jsonResponse);
      _randomNumber = random.nextInt(jsonResponse['results'].length);
      setState(() {});
    } else {
      print('getNowPlayList status: ${response.statusCode}.');
    }
  }

  void getUpcomingPlayList() async {
    var url = Uri.https('api.themoviedb.org', '/3/movie/upcoming',
        {'api_key': '248a52d680518fd97f6e7be12c21157d', 'language': 'ko'});

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      print('getUpcomingPlayList status: $jsonResponse.');
      _upCommingList = MovieList.fromJson(jsonResponse);
      setState(() {});
    } else {
      print('getUpcomingPlayList status: ${response.statusCode}.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: false,
        //backgroundColor: Colors.transparent,
        backgroundColor: const Color(0x44000000),
        elevation: 0,
        title: Image.asset(
          'images/n_logo.png',
          width: 60,
        ),
      ),
      body: (_nowPlayList == null || _upCommingList == null)
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      CachedNetworkImage(
                          imageUrl:
                              '$imageUrl${_nowPlayList?.results[_randomNumber].posterPath}'),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 10.0),
                        child: Column(
                          children: [
                            Text(
                              '${_nowPlayList?.results[_randomNumber].title}',
                              style: kTextDecoration.copyWith(
                                  fontSize: 25.0, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: _nowPlayList != null ? _nowPlayList!.results[_randomNumber].genreIds.map<Widget>((genre) => Text('${genreNames.firstWhere((element) => element['id'] == genre)['name']}')).toList() : [],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text('내가 찜한 콘텐츠'),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    '현재 상영중인 영화',
                    style: kTextDecoration.copyWith(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 175,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: _nowPlayList!.results
                            .map<Widget>((movie) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 5),
                                  child: GestureDetector(
                                    onTap: () {
                                      showModal(context: context, movie: movie);
                                    },
                                    child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: CachedNetworkImage(
                                          imageUrl:
                                              '$imageUrl${movie.posterPath}',
                                          width: 120,
                                          height: 175,
                                          fit: BoxFit.fill,
                                        )

                                        // child: Image.network(
                                        //   '$imageUrl${movie.posterPath}',
                                        //   width: 120,
                                        //   height: 175,
                                        //   fit: BoxFit.fill,
                                        // ),
                                        ),
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    '상영예정 영화',
                    style: kTextDecoration.copyWith(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 175,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: _upCommingList!.results
                            .map<Widget>((movie) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 5),
                                  child: GestureDetector(
                                    onTap: () {
                                      showModal(context: context, movie: movie);
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            '$imageUrl${movie.posterPath}',
                                        width: 120,
                                        height: 175,
                                        fit: BoxFit.fill,
                                      ),
                                      // child: Image.network(
                                      //   '$imageUrl${movie.posterPath}',
                                      //   width: 120,
                                      //   height: 175,
                                      //   fit: BoxFit.fill,
                                      // ),
                                    ),
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
    );
  }
}

//포스터 클릭시 상세정보 모달
void showModal({required context, required movie}) {
  print('showmodal: ${movie.overview}');
  showModalBottomSheet(
    backgroundColor: const Color(0x44000000),
    context: context,
    builder: (BuildContext context) {
      return Container(
        padding: const EdgeInsets.all(15.0),
        height: MediaQuery.of(context).size.height * 0.4,
        decoration: BoxDecoration(
          color: Colors.grey[800],
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(20.0),
            bottom: Radius.circular(0),
          ),
        ),
        child: Center(
          child: Column(
            children: <Widget>[
              Flexible(
                flex: 3,
                fit: FlexFit.loose,
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: CachedNetworkImage(
                        imageUrl:
                            'https://image.tmdb.org/t/p/original${movie.posterPath}',
                      ),
                    ),
                    Flexible(
                      fit: FlexFit.loose,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${movie!.title}',
                              style: const TextStyle(fontSize: 20.0),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Text(
                                movie.overview.length > 50 ? '${movie.overview.toString().substring(0, 50)}...' : '설명없음.'),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Flexible(
                flex: 2,
                fit: FlexFit.loose,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.play_arrow_sharp),
                        Text('재생')
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.play_arrow_sharp),
                        Text('재생')
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.play_arrow_sharp),
                        Text('재생')
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.play_arrow_sharp),
                        Text('재생')
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                decoration: const BoxDecoration(
                    border: Border(
                  top: BorderSide(
                    // POINT
                    color: Colors.white60,
                    width: 1.0,
                  ),
                )),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    movieBloc.setMovieId(movieId: movie.id);
                    Navigator.pushNamed(context, MovieScreen.id);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Icon(
                            Icons.info_outline,
                            color: Colors.white,
                          ),
                          Text('회차정보 및 상제정보')
                        ],
                      ),
                      const Icon(Icons.arrow_forward_ios, color: Colors.white),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
    },
  );
}
