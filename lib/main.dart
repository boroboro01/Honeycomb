import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comb/components/goal_comb.dart';
import 'package:comb/screeens/honeycomb_screen.dart';
import 'package:flutter/material.dart';
import 'screeens/welcome_screen.dart';
import 'screeens/registration_screen.dart';
import 'screeens/login_screen.dart';
import 'screeens/shelf_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(Comb());
}

class Comb extends StatelessWidget {
  Comb({Key? key}) : super(key: key);
  Timestamp timestamp = Timestamp.now();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.amber),
      initialRoute: WelcomeScreen.id,
      routes: {
        ShelfScreen.id: (context) => const ShelfScreen(),
        WelcomeScreen.id: (context) => const WelcomeScreen(),
        LoginScreen.id: (context) => const LoginScreen(),
        RegistrationScreen.id: (context) => const RegistrationScreen(),
        HoneycombScreen.id: (context) => HoneycombScreen(
              goalComb: GoalComb(
                goalTitle: 'Nothing',
                goalWriter: 'Anonymous',
                goalCompleted: false,
                goalStartTime: timestamp,
                goalIndex: 0,
              ),
            ),
        // PostScreen.id: (context) => const PostScreen(),
      },
    );
  }
}
