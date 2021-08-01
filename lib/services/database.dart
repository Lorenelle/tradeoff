import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  searchByEmail(String email) async {
    try {
      var res = await _firestore
          .collection('users')
          .where('email', isEqualTo: email.toLowerCase())
          .get();
      print(res.docs.length);
      return res.docs.first;
    } catch (e) {
      print(e);
    }
  }
}
