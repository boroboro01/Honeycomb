import 'package:comb/constants.dart';

import 'login_screen.dart';
import 'registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:comb/components/rounded_buttoon.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcom_screen';

  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightComb,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: SizedBox(
                    height: 80,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
                const SizedBox(
                  child: DefaultTextStyle(
                    style: TextStyle(
                      fontSize: 45.0,
                      fontWeight: FontWeight.w900,
                    ),
                    child: Text('Honeycomb'),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              color: mediumComb,
              title: 'Log In',
              buttonFunction: () =>
                  Navigator.pushNamed(context, LoginScreen.id),
            ),
            RoundedButton(
              color: darkComb,
              title: 'Register',
              buttonFunction: () =>
                  Navigator.pushNamed(context, RegistrationScreen.id),
            ),
          ],
        ),
      ),
    );
  }
}
