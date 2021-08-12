import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'profile_menu.dart';

class ProfileBody extends StatelessWidget {

  Future<void> _signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) 
  {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          //Profile pic soon
          SizedBox(height: 20),
          ProfileMenu(
            text: "N/A", 
            icon: "assets/icons/Settings.svg",
            press: () {}),
          ProfileMenu(
            text: "N/A", 
            icon: "assets/icons/Settings.svg",
            press: () {}),
          ProfileMenu(
            text: "N/A", 
            icon: "assets/icons/Settings.svg", 
            press: () {}),
          ProfileMenu(
            text: "Settings", 
            icon: "assets/icons/Settings.svg",
            press: () {}),
          ProfileMenu(
            text: "Log Out", 
            icon: "assets/icons/Log Out.svg",
            press: _signOut,),
        ],
      ),
    );
  }
}