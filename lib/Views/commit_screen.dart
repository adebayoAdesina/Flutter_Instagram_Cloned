import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_instagram_clone/Resources/firestore_method.dart';
import 'package:flutter_instagram_clone/Utils/colors.dart';
import 'package:provider/provider.dart';

import '../Model/user.dart';
import '../Provider/user_provider.dart';
import '../Widgets/comment_card.dart';

class CommentScreen extends StatefulWidget {
  final snap;
  const CommentScreen({Key? key, required this.snap}) : super(key: key);

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  TextEditingController? textEditingController;

  @override
  void initState() {
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    textEditingController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final User? user = context.watch<UserProvider>().getUser;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: const Text('Comments'),
        centerTitle: false,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('Posts')
            .doc(widget.snap['postId'])
            .collection('Comments')
            .snapshots(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: widget.snap['postId'].length,
            itemBuilder: (context, index) {
              return CommentCard();
            },
          );
        }),
      ),
      bottomNavigationBar: SafeArea(
          child: Container(
        height: kToolbarHeight,
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        padding: const EdgeInsets.only(left: 16, right: 8),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(user!.photoUrl),
              radius: 18,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 8.0),
                child: TextField(
                  controller: textEditingController,
                  decoration: InputDecoration(
                    hintText: 'Commit as ${user.username}',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: (() async {
                await FireStoreMethod().postComment(
                  widget.snap['postId'],
                  textEditingController!.text,
                  user.uid,
                  user.username,
                  user.photoUrl,
                );
              }),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                child: const Text(
                  'Post',
                  style: TextStyle(
                    color: Colors.blueAccent,
                  ),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
