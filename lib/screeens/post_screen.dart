import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:comb/components/regular_button.dart';
import 'package:comb/constants.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatelessWidget {
  static String id = 'post_screen';

  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String newGoalTitle = '';
    final CollectionReference goalsCollection =
        FirebaseFirestore.instance.collection('Goals');
    final currentUser = FirebaseAuth.instance.currentUser!;

    Future<void> addGoal() {
      return goalsCollection
          .add({
            'goalTitle': newGoalTitle,
            'writer': currentUser.email,
            'goalCompleted': false,
            'timestamp': FieldValue.serverTimestamp(),
          })
          .then((value) => print("Goal Added"))
          .catchError((error) => print("Failed to add goal: $error"));
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Create Honeycomb'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 20.0, left: 20.0),
            child: Text(
              'What is your goal?',
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: kPostTextFieldDecoration,
              onChanged: (newText) {
                newGoalTitle = newText;
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20.0, left: 20.0),
            child: Text(
              'Explain your goal',
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              decoration: kPostTextFieldDecoration,
            ),
          ),
          // Text(user),
          // Text(time),
          Center(
            child: RegularButton(
              text: 'Save',
              onPressed: () {
                addGoal();
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
