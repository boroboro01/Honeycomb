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
      backgroundColor: Colors.grey[100],
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        color: mediumComb,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Hero(
                      tag: 'logo',
                      child: SizedBox(
                        height: 200.0,
                        child: Image.asset('assets/images/logo.png'),
                      ),
                    ),
                    const SizedBox(
                      child: DefaultTextStyle(
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w900,
                          color: lightComb,
                        ),
                        child: Text(
                          'Welcome back you\'ve been missed!',
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 60.0,
                    ),
                  ],
                ),
              ),
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                        subTitle: '',
                        buttonFunction: () async {
                          setState(() {
                            showSpinner = true;
                          });
                          try {
                            final user = await _auth.signInWithEmailAndPassword(
                                email: email, password: password);
                            Navigator.pushNamedAndRemoveUntil(
                                context, ShelfScreen.id, (route) => false);
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
                    const SizedBox(
                      height: 50.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
