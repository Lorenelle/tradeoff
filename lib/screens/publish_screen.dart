import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Publish extends StatefulWidget {
  static String id = 'publish_screen';
  @override
  _PublishState createState() => _PublishState();
}

class _PublishState extends State<Publish> {
  File _image;
  Future getImage() async{
    final image = await ImagePicker.pickImage(source: ImageSource.camera);
    
    setState(() {
      _image = image;
    });

  }

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
        //

      ),
      body: Center(
        child: _image == null  ? Text("Image is not loaded"): Image.file(_image)

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Increment',
        child: Icon(Icons.camera_alt),
      ),
    );
  }
}
