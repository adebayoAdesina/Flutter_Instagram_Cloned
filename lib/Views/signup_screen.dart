import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Utils/colors.dart';
import '../Widgets/text_field_inputs.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _usernameController.dispose();
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
            //circlar widget to accept and show our selected file
            Stack(
              clipBehavior: Clip.none,
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundColor: primaryColor,
                  backgroundImage: AssetImage('assets/profile image.png'),
                ),
                Positioned(
                  bottom: -13,
                  left: 40,
                  child: Container(
                    padding: const EdgeInsets.all(0.1),
                    decoration: BoxDecoration(
                        color: blueColor,
                        borderRadius: BorderRadius.circular(30)),
                    child: IconButton(
                        padding: const EdgeInsets.all(0.1),
                        onPressed: (() {}),
                        icon: const Icon(
                          Icons.add_a_photo,
                          size: 16,
                        )),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            TextFieldInput(
              textEditingController: _usernameController,
              hintText: 'Enter your username',
              textInputType: TextInputType.text,
            ),
            const SizedBox(
              height: 24,
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
            TextFieldInput(
              textEditingController: _bioController,
              hintText: 'Enter your bio',
              textInputType: TextInputType.text,
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
                    child: const Text('Already have an account?'),
                    padding: const EdgeInsets.symmetric(vertical: 8)),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                      child: const Text(
                        'Log in.',
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
