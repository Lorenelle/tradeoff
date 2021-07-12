import 'package:flutter/material.dart';
import 'package:tradeoff5/screens/home.dart';
import 'package:tradeoff5/screens/favorite_screen.dart';
import 'package:tradeoff5/screens/publish_screen.dart';
import 'package:tradeoff5/screens/notification_screen.dart';
import 'package:tradeoff5/screens/profile_screen.dart';

class Main extends StatefulWidget {
  static String id = 'main_screen';
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  int value = 0;
  bool isInit = false;

  List<dynamic> pages = [
    Home(),
    Favorite(),
    Publish(),
    NotificationScreen(),
    Profile()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: pages[value],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add Item',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notification_add),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
        unselectedItemColor: Colors.grey,
        onTap: (val) => setState(() => value = val),
        currentIndex: value,
        elevation: 3,
        selectedItemColor: Colors.blue,
      ),
    );
  }
}
