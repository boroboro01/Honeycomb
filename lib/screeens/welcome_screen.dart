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
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Flexible(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Hero(
                    tag: 'logo',
                    child: SizedBox(
                      height: 350,
                      child: Image.asset('assets/images/logo.png'),
                    ),
                  ),
                  const SizedBox(
                    child: DefaultTextStyle(
                      style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.w900,
                        color: lightComb,
                      ),
                      child: Text(
                        'Honeycomb',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 70.0,
                  ),
                ],
              ),
            ),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(
                    height: 70.0,
                  ),
                  RoundedButton(
                    color: mediumComb,
                    title: 'Start',
                    subTitle: '',
                    buttonFunction: () =>
                        Navigator.pushNamed(context, RegistrationScreen.id),
                  ),
                  RoundedButton(
                    color: const Color.fromRGBO(200, 200, 200, 1),
                    title: 'Do you have account?',
                    subTitle: ' Login',
                    buttonFunction: () =>
                        Navigator.pushNamed(context, LoginScreen.id),
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
