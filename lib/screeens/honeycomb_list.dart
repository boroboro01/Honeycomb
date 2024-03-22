import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comb/constants.dart';
import 'package:comb/screeens/post_screen.dart';
import 'package:flutter/material.dart';
import 'package:comb/components/goal_comb.dart';

class HoneycombList extends StatefulWidget {
  const HoneycombList({super.key});

  @override
  State<HoneycombList> createState() => _HoneycombListState();
}

class _HoneycombListState extends State<HoneycombList> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    List<GoalComb> goalList = [];
    final goals = _firestore.collection('Goals');
    final goal1 = <String, dynamic>{
      'goalTitle': 'Example',
      'writer': 'example wirter',
      'goalCompleted': false,
      'timestamp': Timestamp.now(),
    };
    goals.doc('tester').set(goal1);
    final goal2 = <String, dynamic>{
      'goalTitle': 'Example2',
      'writer': 'example wirter2',
      'goalCompleted': false,
      'timestamp': Timestamp.now(),
    };
    goals.doc('tester2').set(goal2);

    final ref = goals.doc('tester').withConverter(
        fromFirestore: GoalComb.fromFirestore,
        toFirestore: (GoalComb goalComb, _) => goalComb.toFirestore());
    final docRef = goals.doc("tester");

    goals.get().then(
      (querySnapshot) {
        print('Successfully completed');
        for (var docSnapshot in querySnapshot.docs) {
          print('${docSnapshot.id} => ${docSnapshot.data()}');
          final goal = GoalComb(
            goalTitle: docSnapshot.get('goalTitle'),
            goalWriter: docSnapshot.get('writer'),
            goalCompleted: docSnapshot.get('goalCompleted'),
            goalIndex: 1,
            goalStartTime: docSnapshot.get('timestamp'),
          );
          goalList.add(goal);
          print('goalListLength : ${goalList.length}');
        }
      },
      onError: (e) => print('Error completing: $e'),
    );
    print('goalListLength : ${goalList.length}');

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const PostScreen(),
            ),
          );
        },
        // onPressed: createNewObject,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Text(goalList[index].goalTitle);
        },
        itemCount: goalList.length,
      ),
    );
  }
}
