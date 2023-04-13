import 'package:flutter/material.dart';
import 'package:flutterapp/Screens/login_screen.dart';
import 'package:flutterapp/Screens/splash_screen.dart';
import 'package:flutterapp/Screens/forgot_password.dart';
import 'package:flutterapp/Screens/home_screen.dart';
import 'package:flutterapp/Screens/profile_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => LoginScreen(),
    '/home': (context) => HomeScreen(),
   '/forgot_password': (context) => ForgotPasswordScreen(),
      },
    );
  }
}