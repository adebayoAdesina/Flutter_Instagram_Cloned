import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommentCard extends StatefulWidget {
  const CommentCard({Key? key}) : super(key: key);

  @override
  State<CommentCard> createState() => _CommentCardState();
}

class _CommentCardState extends State<CommentCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(''),
            radius: 18,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 15,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: 'username',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: 'some description to insert',
                    )
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    '23/12/22',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: const Icon(
                      Icons.favorite,
                      size: 16,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
