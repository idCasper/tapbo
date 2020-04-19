import 'package:flutter/material.dart';
import 'package:flutter_speech_to_text/pages/home_page.dart';
import 'package:flutter_speech_to_text/pages/landing_page.dart';
import 'package:flutter_speech_to_text/pages/login_page.dart';
import 'package:flutter_speech_to_text/pages/register_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Menu',
      initialRoute: '/',
      routes: {
        '/' : (context) => LandingPage(),
        '/login' : (context) => LoginPage(),
        '/home' : (context) => HomePage(),
        '/register' : (context) => RegisterPage()
      },
    );
  }
}
