import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tradeoff5/screens/home.dart';
import 'package:tradeoff5/screens/login_screen.dart';
import 'package:tradeoff5/screens/main.dart';
import 'package:tradeoff5/screens/registration_screen.dart';
import 'package:tradeoff5/screens/welcome_screen.dart';
import 'package:tradeoff5/screens/publish_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tradeoff5/services/helper.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(
            create: (_) => AuthService(FirebaseAuth.instance)),
        StreamProvider(
          initialData: () {},
          create: (context) => context.read<AuthService>().authStateChanges,
        )
      ],
      child: App(),
    );
  }
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trade-Off',
      initialRoute: Publish.id,
      theme: ThemeData(fontFamily: 'Balsamiq_Sans'),
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        Home.id: (context) => Home(),
        Main.id: (context) => Main(),
        LoginScreen.id: (context) => LoginScreen(),
      },
    );
  }
}
