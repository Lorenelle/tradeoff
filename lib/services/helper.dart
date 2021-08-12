import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final FirebaseAuth _auth;
  AuthService(this._auth);

  Stream<User> get authStateChanges => _auth.idTokenChanges();

  String getCurrentUID() {
    return _auth.currentUser.uid;
  }

  Future getCurrentUser() async {
    return _auth.currentUser;
  }

  Future<String> login(String email, String password) async {
    try {
      _auth.signInWithEmailAndPassword(email: email, password: password);

      return "Logged In";
    } catch (e) {
      return e;
    }
  }

  Future<String> register(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return "Successfully Registered";
    } catch (e) {
      return e;
    }
  }
}

class HelperService {
  static String emailKey = "EMAIL";
  static String uidkey = "UID";

  static Future<bool> saveEmail(String email) async {
    SharedPreferences _sharedPreferences =
        await SharedPreferences.getInstance();
    return await _sharedPreferences.setString(emailKey, email);
  }

  static Future<bool> saveUID(String uid) async {
    SharedPreferences _sharedPreferences =
        await SharedPreferences.getInstance();
    return await _sharedPreferences.setString(uidkey, uid);
  }
}

class EmailValidator {
  static String validate(String value) {
    if (value.isEmpty) {
      return "Email can't be empty";
    } else
      return null;
  }
}
