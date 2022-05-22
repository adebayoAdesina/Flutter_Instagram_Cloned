import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _store = FirebaseFirestore.instance;

  //sign up user
  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String bio,
    required Uint8List file,
  }) async {
    String res = "Some error occured";
    try {
      if (email.isNotEmpty &&
          password.isNotEmpty &&
          username.isNotEmpty &&
          bio.isNotEmpty &&
          file != null ) {
        // register user
        UserCredential credential = await _auth.signInWithEmailAndPassword(email: email, password: password);
        print(credential.user!.displayName);
        // to get the user id
        print(credential.user!.uid);

        //add user to our database

      } else {}
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
