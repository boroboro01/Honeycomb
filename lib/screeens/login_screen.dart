import 'package:comb/screeens/shelf_screen.dart';
import 'package:flutter/material.dart';
import 'package:comb/components/rounded_buttoon.dart';
import 'package:comb/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool showSpinner = false;
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightComb,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: SizedBox(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              const SizedBox(
                height: 48.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email = value;
                },
                decoration: kTextFieldDecoration,
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  password = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter your password'),
              ),
              const SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                  color: mediumComb,
                  title: 'Log In',
                  buttonFunction: () async {
                    setState(() {
                      showSpinner = true;
                    });
                    try {
                      final user = await _auth.signInWithEmailAndPassword(
                          email: email, password: password);
                      Navigator.pushNamed(context, ShelfScreen.id);
                      print('Loggin success');
                      setState(() {
                        showSpinner = false;
                      });
                    } on FirebaseAuthException catch (e) {
                      print('Loggin failure');
                      setState(() {
                        showSpinner = false;
                      });
                      if (e.code == 'user-not-found') {
                        print('No user found for that email');
                      } else if (e.code == 'wrong-password') {
                        print('Wrong password provided for that user');
                      }
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
