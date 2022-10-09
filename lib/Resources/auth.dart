import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter_instagram_clone/Model/user.dart' as model;
import 'package:flutter_instagram_clone/Resources/storage_methods.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _store = FirebaseFirestore.instance;

  Future<model.User> getUserDetails() async {
    User currentUser = _auth.currentUser!;

    DocumentSnapshot snap =
        await _store.collection('users').doc(currentUser.uid).get();

    return model.User.fromSnap(snap);
  }

  //sign up user
  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String bio,
    required Uint8List file,
  }) async {
    String res = "Some error occured";
    // await Firebase.initializeApp();
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          bio.isNotEmpty || file != null) {
         
        // register user
        UserCredential credential = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        // print(credential.user!.displayName);
        // to get the user id
        print(credential.user!.uid);

        String photoUrl = await StorageMethod()
            .uploadImageToStorage('profilePic', file, false);

        model.User user = model.User(
          username: username,
          uid: credential.user!.uid,
          bio: bio,
          email: email,
          photoUrl: photoUrl,
          followers: [],
          following: [],
        );

        // add user to our database
        // await _store.collection('users').doc(credential.user!.uid).set({
        //   'username': username,
        //   'uid': credential.user!.uid,
        //   'bio': bio,
        //   'email': email,
        //   'followers': [],
        //   'following': [],
        //   'photoUrl': photoUrl,
        // });
        // res = 'success';
        await _store
            .collection('users')
            .doc(credential.user!.uid)
            .set(user.toJson());
        res = 'success';
      }
    } on FirebaseAuthException catch (error) {
      if (error.code == 'invalid-email') {
        res = 'The email is badly formatted.';
      } else if (error.code == 'weak-password') {
        res = 'Password should be at least 6 characters';
      }
      else {
        res = error.code;
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  Future<String> loginUser(
      {required String email, required String password}) async {
    String res = "some error occur";

    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = 'success';
      } else {
        res = "Please enter all the fields";
      }
    } on FirebaseAuthException catch (error) {
      if (error.code == 'user-not-found') {
        res = ' user not found';
      } else if (error.code == 'wrong-password') {
        res = 'wrong password';
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
