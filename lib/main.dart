import 'package:comb/constants.dart';
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
  runApp(const Comb());
}

class Comb extends StatelessWidget {
  const Comb({Key? key}) : super(key: key);

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
      },
    );
  }
}
