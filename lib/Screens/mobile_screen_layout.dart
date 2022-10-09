
import 'package:flutter/material.dart';
import 'package:flutter_instagram_clone/Provider/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_instagram_clone/Model/user.dart' as model;

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({Key? key}) : super(key: key);

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  // String username = "";

  // @override
  // void initState() {
  //   super.initState();
  //   getUsername();
  // }

  // void getUsername() async {
  //   DocumentSnapshot snap = await FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(FirebaseAuth.instance.currentUser!.uid).get();
        

  //       setState(() {
  //         username = (snap.data() as Map<String, dynamic>)['username'];
  //       });
  // }

  @override
  Widget build(BuildContext context) {
    model.User? user = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
      body: Center(child: Text(user!.email.toString())),
    );
  }
}