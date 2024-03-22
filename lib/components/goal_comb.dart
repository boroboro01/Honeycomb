import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comb/screeens/honeycomb_screen.dart';
import 'package:flutter/material.dart';

class GoalComb extends StatelessWidget {
  const GoalComb({
    super.key,
    required this.goalTitle,
    required this.goalWriter,
    required this.goalCompleted,
    required this.goalIndex,
    required this.goalStartTime,
  });

  final String goalTitle;
  final String goalWriter;
  final Timestamp goalStartTime;
  final bool goalCompleted;
  final int goalIndex;

  factory GoalComb.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return GoalComb(
        goalTitle: data?['title'],
        goalWriter: data?['writer'],
        goalCompleted: data?['completed'],
        goalIndex: data?['index'],
        goalStartTime: data?['timestamp']);
  }
  Map<String, dynamic> toFirestore() {
    return {
      "title": goalTitle,
      "writer": goalWriter,
      "completed": goalCompleted,
      "index": goalIndex,
      "timestamp": goalStartTime,
    };
  }

  @override
  Widget build(BuildContext context) {
    int goalNumber = goalIndex + 1;
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
                      goalTitle: goalTitle,
                      goalWriter: goalWriter,
                      goalCompleted: goalCompleted,
                      goalIndex: goalNumber,
                      goalStartTime: goalStartTime,
                    ),
                  )));
        },
        child: Column(
          children: [
            Text(
              goalTitle,
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
