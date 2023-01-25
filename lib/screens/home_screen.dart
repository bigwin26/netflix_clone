import 'package:flutter/material.dart';
import 'package:netflix_clone/models/MovieList.dart';
import 'package:netflix_clone/styles/constans.dart';

import 'dart:math';

import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

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
      print('getUpcomingPlayList status: ${jsonResponse}.');
      _upCommingList = MovieList.fromJson(jsonResponse);
      setState(() {});
    } else {
      print('getUpcomingPlayList status: ${response.statusCode}.');
    }
  }

  @override
  Widget build(BuildContext context) {
    print('hihiyoyo $_nowPlayList ?? null');
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
      body: _nowPlayList == null
          ? Text('null')
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Image.network(
                          'https://image.tmdb.org/t/p/original${_nowPlayList?.results[_randomNumber].posterPath}'),
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 10.0),
                        child: Column(
                          children: [
                            Text(
                              '${_nowPlayList?.results[_randomNumber].title}',
                              style: kTextDecoration.copyWith(
                                  fontSize: 25.0, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('스릴있는'),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('내가 찜한 콘텐츠'),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    '현재 상영중인 영화',
                    style: kTextDecoration.copyWith(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 175,
                    child: _nowPlayList?.results != null
                        ? ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: _nowPlayList?.results.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 5),
                                child: GestureDetector(
                                  onTap: () {
                                    showModal(
                                        context: context,
                                        movie: _nowPlayList?.results[index]);
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.network(
                                      'https://image.tmdb.org/t/p/original${_nowPlayList?.results[index].posterPath}',
                                      width: 120,
                                      height: 175,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              );
                            })
                        : SizedBox(
                            height: 10,
                          ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    '상영예정 영화',
                    style: kTextDecoration.copyWith(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 175,
                    child: _upCommingList?.results != null
                        ? ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: _upCommingList?.results.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 5),
                                child: GestureDetector(
                                  onTap: () {
                                    showModal(
                                        context: context,
                                        movie: _upCommingList?.results[index]);
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.network(
                                      'https://image.tmdb.org/t/p/original${_upCommingList?.results[index].posterPath}',
                                      width: 120,
                                      height: 175,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              );
                            })
                        : SizedBox(
                            height: 10,
                          ),
                  ),
                  SizedBox(
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
  showModalBottomSheet(
    backgroundColor: const Color(0x44000000),
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.3,
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
                    Image.network(
                      'https://image.tmdb.org/t/p/original${movie.posterPath}',
                    ),
                    Text('${movie!.title}'),
                  ],
                ),
              ),
              Flexible(
                flex: 2,
                fit: FlexFit.loose,
                child: Row(
                  children: [
                    Text('${movie!.title}'),
                  ],
                ),
              ),
              // ElevatedButton(
              //   child: const Text('Close BottomSheet'),
              //   onPressed: () => Navigator.pop(context),
              // ),
            ],
          ),
        ),
      );
    },
  );
}
