import 'package:flutter/material.dart';
import 'package:tradeoff5/screens/home.dart';
import 'package:tradeoff5/screens/main.dart';
import 'package:tradeoff5/screens/registration_screen.dart';
import 'package:tradeoff5/screens/welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trade-Off',
      initialRoute: Main.id,
      theme: ThemeData(fontFamily: 'Balsamiq_Sans'),
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        Home.id: (context) => Home(),
        Main.id: (context) => Main(),
      },
    );
  }
}
