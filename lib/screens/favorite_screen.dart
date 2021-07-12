import 'package:flutter/material.dart';

class Favorite extends StatefulWidget {
  static String id = 'favorite_screen';
  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Favorite Page'),
        centerTitle: true,
      ),
    );
  }
}
