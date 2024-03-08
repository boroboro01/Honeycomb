import 'package:comb/constants.dart';
import 'package:comb/screeens/honeycomb_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

FirebaseFirestore _firestore = FirebaseFirestore.instance;

class GoalComb extends StatelessWidget {
  GoalComb({
    super.key,
    required this.goalName,
    required this.goalCompleted,
    required this.goalNumber,
    required this.deleteCallback,
  });

  final String goalName;
  final bool goalCompleted;
  final int goalNumber;
  final Function deleteCallback;

  final _auth = FirebaseAuth.instance;
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    int goalIndex = goalNumber + 1;
    return Padding(
      padding: const EdgeInsets.only(
        left: 25.0,
        right: 25.0,
        top: 25.0,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(24.0),
        ),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => HoneycombScreen(
                    goalComb: GoalComb(
                      goalName: goalName,
                      goalCompleted: goalCompleted,
                      goalNumber: goalIndex,
                      deleteCallback: deleteCallback,
                    ),
                  )));
        },
        child: Column(
          children: [
            Text(
              goalName,
            ),
            Text(
              '$goalIndex',
            )
          ],
        ),
      ),
    );
  }
}
