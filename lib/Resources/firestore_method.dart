import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_instagram_clone/Model/post.dart';
import 'package:flutter_instagram_clone/Resources/storage_methods.dart';
import 'package:uuid/uuid.dart';

class FireStoreMethod {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<String> uploadPost(String description, Uint8List file, String uid,
      String username, String profImage) async {
    String res = 'some error occur';
    try {
      String postUrl =
          await StorageMethod().uploadImageToStorage('postImage', file, true);
      String postId = const Uuid().v1();
      Post post = Post(
        description: description,
        uid: uid,
        postId: postId,
        username: username,
        datePublished: DateTime.now(),
        postUrl: postUrl,
        profImage: profImage,
        likes: [],
      );

      firebaseFirestore.collection('Posts').doc(postId).set(
            post.toJson(),
          );
      res = 'success';
    } catch (e) {}
    return res;
  }
}
