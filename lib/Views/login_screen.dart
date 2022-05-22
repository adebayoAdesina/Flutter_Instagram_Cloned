import 'package:flutter/material.dart';
import 'package:flutter_instagram_clone/Utils/colors.dart';
import 'package:flutter_instagram_clone/Views/signup_screen.dart';
import 'package:flutter_instagram_clone/Widgets/text_field_inputs.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Container(),
              flex: 1,
            ),
            SvgPicture.asset(
              'assets/instagram-silhouette-stroke-logo-by-Vexels.svg',
              color: primaryColor,
              height: 200,
            ),
            TextFieldInput(
                textEditingController: _emailController,
                hintText: 'Enter your email',
                textInputType: TextInputType.emailAddress),
            const SizedBox(
              height: 24,
            ),
            TextFieldInput(
              textEditingController: _passwordController,
              hintText: 'Enter your password',
              textInputType: TextInputType.text,
              isPass: true,
            ),
            const SizedBox(
              height: 24,
            ),
            GestureDetector(
              onTap: (() {}),
              child: Container(
                child: const Text('Log in'),
                width: double.infinity,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                    color: blueColor),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Flexible(
              child: Container(),
              flex: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    child: const Text('Dont have an account?'),
                    padding: const EdgeInsets.symmetric(vertical: 8)),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const SignUpScreen()));
                  },
                  child: Container(
                      child: const Text(
                        'Sign up.',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: blueColor),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 3)),
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
