import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_instagram_clone/Resources/storage_methods.dart';

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
    await Firebase.initializeApp();
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          bio.isNotEmpty ||
          file != null) {
        // register user
        UserCredential credential = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        print(credential.user!.displayName);
        // to get the user id
        print(credential.user!.uid);

        String photoUrl = await StorageMethod()
            .uploadImageToStorage('profilePic', file, false);

        //add user to our database
        await _store.collection('users').doc(credential.user!.uid).set({
          'username': username,
          'uid': credential.user!.uid,
          'bio': bio,
          'followers': [],
          'following': [],
          'photoUrl': photoUrl,
        });
        res = 'success';
      } else {}
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
