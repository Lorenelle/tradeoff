import 'package:flutter/material.dart';

class Publish extends StatefulWidget {
  static String id = 'registration_screen';
  @override
  _PublishState createState() => _PublishState();
}

class _PublishState extends State<Publish> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Publish'),
        centerTitle: true,
      ),
    );
  }
}
