import 'package:flutter/material.dart';
import 'package:netflix_clone/screens/auth/welcome_screen.dart';
import 'package:netflix_clone/screens/home_screen.dart';
import 'package:netflix_clone/styles/constans.dart';

class LoginScreen extends StatelessWidget {
  static String id = 'login_screen';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          //backgroundColor: Colors.transparent,
          backgroundColor: const Color(0x44000000),
          elevation: 0,
          title: Image.asset(
            'images/netflix_logo.png',
            width: 120,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 0),
                child: Text(
                  '로그인',
                  style: kTextDecoration.copyWith(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              inputBox(
                  type: TextInputType.emailAddress,
                  hintText: '이메일 주소를 입력해주세요.',
                  labelText: '이메일 주소'),
              const SizedBox(
                height: 20,
              ),
              inputBox(
                  hintText: '비밀번호를 입력해주세요.', labelText: '비밀번호', secure: true),
              const SizedBox(
                height: 60,
              ),
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                decoration: BoxDecoration(
                  color: const Color(0xffe50914),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, HomeScreen.id, (route) => false);
                  },
                  child: const Text(
                    '로그인',
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

Widget inputBox(
    {required String hintText,
    required String labelText,
    TextInputType? type,
    bool secure = false}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5.0),
      color: const Color(0xff333333),
    ),
    child: TextField(
      onChanged: (value) {
        //Do something with the user input.
      },
      obscureText: secure,
      keyboardType: type ?? TextInputType.text,
      style: kTextDecoration,
      decoration: kTextFieldDecoration.copyWith(
          hintText: hintText, labelText: labelText),
    ),
  );
}
