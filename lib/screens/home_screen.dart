import 'package:flutter/material.dart';
import 'package:netflix_clone/models/NowPlayList.dart';
import 'package:netflix_clone/styles/constans.dart';

import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  static String id = 'home_screen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NowPlayList? _nowPlayList;
  Results? _results;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNowPlayList();
  }

 void getNowPlayList() async {
    print('hihi');
    var url = Uri.https('api.themoviedb.org', '/3/movie/now_playing', {'api_key': '248a52d680518fd97f6e7be12c21157d'});

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
      convert.jsonDecode(response.body) as Map<String, dynamic>;
      print('getNowPlayList status: ${response.statusCode}.');
      _nowPlayList = NowPlayList.fromJson(jsonResponse);
      setState(() {

      });
    } else {
      print('getNowPlayList status: ${response.statusCode}.');
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
      body: _nowPlayList == null ? Text('null') : SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Image.network(
                    'https://image.tmdb.org/t/p/original${_nowPlayList?.results[0].posterPath}'),
                Container(
                  padding:
                  EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                  child: Column(
                    children: [
                      Text(
                        'Puss in Boots: The Last Wish',
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
              '다시보기 추천 콘텐츠',
              style: kTextDecoration.copyWith(
                  fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        'https://image.tmdb.org/t/p/original/1NqwE6LP9IEdOZ57NCT51ftHtWT.jpg',
                        width: 120,
                        height: 175,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        'https://image.tmdb.org/t/p/original/1NqwE6LP9IEdOZ57NCT51ftHtWT.jpg',
                        width: 120,
                        height: 175,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        'https://image.tmdb.org/t/p/original/1NqwE6LP9IEdOZ57NCT51ftHtWT.jpg',
                        width: 120,
                        height: 175,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        'https://image.tmdb.org/t/p/original/1NqwE6LP9IEdOZ57NCT51ftHtWT.jpg',
                        width: 120,
                        height: 175,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              '다시보기 추천 콘텐츠',
              style: kTextDecoration.copyWith(
                  fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        'https://image.tmdb.org/t/p/original/1NqwE6LP9IEdOZ57NCT51ftHtWT.jpg',
                        width: 120,
                        height: 175,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        'https://image.tmdb.org/t/p/original/1NqwE6LP9IEdOZ57NCT51ftHtWT.jpg',
                        width: 120,
                        height: 175,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        'https://image.tmdb.org/t/p/original/1NqwE6LP9IEdOZ57NCT51ftHtWT.jpg',
                        width: 120,
                        height: 175,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        'https://image.tmdb.org/t/p/original/1NqwE6LP9IEdOZ57NCT51ftHtWT.jpg',
                        width: 120,
                        height: 175,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
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
