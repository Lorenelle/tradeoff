import 'package:flutter/material.dart';
import 'package:tradeoff5/screens/main.dart';
import 'package:tradeoff5/services/database.dart';
import 'package:tradeoff5/services/helper.dart';
import 'package:provider/provider.dart';
import 'package:tradeoff5/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  DatabaseService _databaseService = DatabaseService();
  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Form(
            child: ListView(
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.only(top: 32.0, right: 16.0, left: 16.0),
              child: Text(
                'Login',
                style: TextStyle(
                    color: Color(COLOR_PRIMARY),
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            ConstrainedBox(
                constraints: BoxConstraints(minWidth: double.infinity),
                child: Padding(
                    padding:
                        const EdgeInsets.only(top: 16.0, right: 8.0, left: 8.0),
                    child: TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            contentPadding: new EdgeInsets.symmetric(
                                vertical: 8, horizontal: 16),
                            fillColor: Colors.white,
                            hintText: 'Email Address',
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide(
                                    color: Color(COLOR_PRIMARY), width: 2.0)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ))))),
            ConstrainedBox(
                constraints: BoxConstraints(minWidth: double.infinity),
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 16.0, right: 8.0, left: 8.0),
                  child: TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      // textInputAction: TextInputAction.next,
                      style: TextStyle(height: 0.8, fontSize: 18.0),
                      cursorColor: Color(COLOR_PRIMARY),
                      decoration: InputDecoration(
                          contentPadding: new EdgeInsets.symmetric(
                              vertical: 8, horizontal: 16),
                          fillColor: Colors.white,
                          hintText: 'Password',
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide: BorderSide(
                                  color: Color(COLOR_PRIMARY), width: 2.0)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ))),
                )),
            Padding(
              padding:
                  const EdgeInsets.only(right: 40.0, left: 40.0, top: 40.0),
              child: ConstrainedBox(
                constraints: const BoxConstraints(minWidth: double.infinity),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(COLOR_PRIMARY),
                      padding: EdgeInsets.only(top: 12, bottom: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        side: BorderSide(
                          color: Color(COLOR_PRIMARY),
                        ),
                      ),
                    ),
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      final String email = _emailController.text.trim();
                      final String password = _passwordController.text.trim();

                      try {
                        context.read<AuthService>().login(email, password);
                        if (email != null && password != null) {
                          _databaseService.searchByEmail(email);
                          Navigator.pushNamed(context, Main.id);
                        }
                        setState(() {
                          showSpinner = false;
                        });
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          print("No user found!");
                        }
                        setState(() {
                          showSpinner = false;
                        });

                        /*
                    if (email.isEmpty || !email.contains('@')) {
                      print("invalid email");
                    } else {
                      if (password.isEmpty) {
                        print("password is empty");
                      } else {
                        context.read<AuthService>().login(email, password);
                        if (email != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return Main();
                            }),
                          );
                        } else {
                          print('user does not exist!');
                        }
                      }
                    }*/
                      }
                    }),
              ),
            ),
          ],
        )));
  }
}
