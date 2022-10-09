import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_instagram_clone/Model/post.dart';
import 'package:flutter_instagram_clone/Resources/storage_methods.dart';

class FireBaseMethod {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<String> uploadPost(String description, Uint8List file, String uid, String username, String profImage) async {
    String res = 'some error occur';
    try {
      String photoURL =
          await StorageMethod().uploadImageToStorage('postImage', file, true);
    Post post = Post(description: description, uid: uid, postId: postId, username: username, datePublished: DateTime.now(), postUrl: postUrl, profImage: profImage, likes: likes)
    } catch (e) {}
    return res;
  }
}
