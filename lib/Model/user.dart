import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String username;
  final String uid;
  final String photoUrl;
  final String bio;
  final String email;
  final List followers;
  final List following;

  User(
      {required this.username,
      required this.uid,
      required this.photoUrl,
      required this.bio,
      required this.email,
      required this.followers,
      required this.following});

  Map<String, dynamic> toJson() => {
        'username': username,
        'uid': uid,
        'bio': bio,
        'email': email,
        'photoUrl': photoUrl,
        'followers': followers,
        'following': following,
      };

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return User(
        username: snapshot['username'],
        uid: snapshot['uid'],
        photoUrl: snapshot['photoUrl'],
        bio: snapshot['bio'],
        email: snapshot['email'],
        followers: snapshot['followers'],
        following: snapshot['following']);
  }
}
