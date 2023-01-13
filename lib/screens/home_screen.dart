import 'package:flutter/material.dart';
import 'package:netflix_clone/styles/constans.dart';

class HomeScreen extends StatelessWidget {
  static String id = 'home_screen';

  const HomeScreen({Key? key}) : super(key: key);

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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Image.network(
                    'https://image.tmdb.org/t/p/original/1NqwE6LP9IEdOZ57NCT51ftHtWT.jpg'),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                  child: Column(
                    children: [
                      Text(
                        'Puss in Boots: The Last Wish',
                        style: kTextDecoration.copyWith(
                            fontSize: 25.0, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('스릴있는'),
                        ],
                      ),
                      SizedBox(height: 10,),
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
          ],
        ),
      ),
    );
  }
}
