import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comb/components/regular_button.dart';
import 'package:comb/constants.dart';
import 'package:comb/resources/goal.dart';
import 'package:comb/resources/goal_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class PostScreen extends StatelessWidget {
  static String id = 'post_screen';

  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String newGoalTitle = '';

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
                  Provider.of<GoalData>(context, listen: false)
                      .addGoal(newGoalTitle);
                  Navigator.pop(context);
                }),
          ),
        ],
      ),
    );
  }
}
