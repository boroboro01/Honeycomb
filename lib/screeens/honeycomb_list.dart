import 'package:comb/components/goal_comb.dart';
import 'package:comb/resources/goal_data.dart';
import 'package:comb/screeens/honeycomb_screen.dart';
import 'package:comb/screeens/post_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/dialog_box.dart';

class HoneycombList extends StatefulWidget {
  const HoneycombList({super.key});

  @override
  State<HoneycombList> createState() => _HoneycombListState();
}

class _HoneycombListState extends State<HoneycombList> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
      body: Consumer<GoalData>(
        builder: (context, goalData, child) {
          return ListView.builder(
            itemCount: goalData.goalCount,
            itemBuilder: (context, index) {
              final goal = goalData.goals[index];
              return GoalComb(
                goalName: goal.name,
                goalCompleted: goal.isDone,
                goalNumber: index,
                deleteCallback: () {
                  goalData.deleteGoal(goal);
                },
              );
            },
          );
        },
      ),
    );
  }
}
