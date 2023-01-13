import 'package:flutter/material.dart';
import 'package:netflix_clone/screens/auth/join_screen.dart';
import 'package:netflix_clone/screens/auth/login_screen.dart';
import 'package:netflix_clone/styles/constans.dart';

class WelcomeScreen extends StatelessWidget {
  static String id = 'welcome_screen';

  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: false,
        //backgroundColor: Colors.transparent,
        backgroundColor: const Color(0x44000000),
        elevation: 0,
        title: Image.asset('images/netflix_logo.png',width: 120,),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, LoginScreen.id);
            },
            child: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              decoration: BoxDecoration(
                color: const Color(0xffe50914),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: const Text(
                '로그인',
                style: TextStyle(color: Colors.white, fontSize: 18.0),
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Stack(
          children: [
            Opacity(
              opacity: 0.6,
              child: Container(
                width: double.infinity,
                height:
                    MediaQuery.of(context).size.height * 0.7, // 디바이스 높이의 70%
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('images/welcome_img.jpg'),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.7, // 디바이스 높이의 70%
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '영화와 시리즈를 무제한으로.',
                    style: kTextDecoration.copyWith(fontSize: 28.0),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20.0),
                  const Text(
                    '다양한 디바이스에서 시청하세요.\n언제든 해지하실 수 있습니다.',
                    style: kTextDecoration,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20.0),
                  const Text(
                    '시청할 준비가 되셨나요?\n멤버십을 등록하거나 재시작하려면\n이메일 주소를 입력하세요.',
                    style: kTextDecoration,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 50.0),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, JoinScreen.id);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      decoration: BoxDecoration(
                        color: const Color(0xffe50914),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: const Text(
                        '가입하기',
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
