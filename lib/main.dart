import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_instagram_clone/Provider/user_provider.dart';
import 'package:flutter_instagram_clone/Responsiveness/responsive.dart';
import 'package:flutter_instagram_clone/Screens/mobileScreenLayout.dart';
import 'package:flutter_instagram_clone/Screens/webScreenLayout.dart';
import 'package:flutter_instagram_clone/Views/home_screen.dart';
import 'package:flutter_instagram_clone/Views/login_screen.dart';
import 'package:provider/provider.dart';
import 'Utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
      apiKey: "AIzaSyD_tKFkdiiAF2xpMa6sNwclr10SYTdLcKs",
      appId: "1:641622622785:web:73d48250ed98cb4d4ebcc0",
      messagingSenderId: "641622622785",
      projectId: "instagram-cloned-e346b",
      storageBucket: "instagram-cloned-e346b.appspot.com",
    ));
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> UserProvider())
      ],
      child: MaterialApp(
        title: 'Instagram Cloned',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: mobileBackgroundColor,
        ),
        home: StreamBuilder(
          // stream: FirebaseAuth.instance.idTokenChanges(),
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                return const ResponsiveLayout(
                  webScreenLayout: WebScreenLayout(),
                  mobileScreenLayout: MobileScreenLayout(),
                );
              } else {
                // return Center(child: Text('${snapshot.error}'));
                return const LoginScreen();
              }
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: primaryColor,
                ),
              );
            }
            return const LoginScreen();
          },
        ),
        // home: const LoginScreen()
      ),
    );
  }
}
