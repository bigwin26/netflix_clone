import 'package:flutter/material.dart';
import 'package:netflix_clone/screens/auth/join_screen.dart';
import 'package:netflix_clone/screens/auth/login_screen.dart';
import 'package:netflix_clone/screens/auth/welcome_screen.dart';
import 'package:netflix_clone/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyText1: TextStyle(color: Colors.white),
          bodyText2: TextStyle(color: Colors.white),
        ),
        scaffoldBackgroundColor: Colors.black,
        backgroundColor: Colors.black,
        primaryColor: Colors.white,
      ),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        JoinScreen.id: (context) => JoinScreen(),
        HomeScreen.id: (context) => HomeScreen(),
      },
    );
  }
}
