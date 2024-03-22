import 'package:comb/components/regular_button.dart';
import 'package:comb/components/goal_comb.dart';
import 'package:flutter/material.dart';

class HoneycombScreen extends StatefulWidget {
  const HoneycombScreen({super.key, required this.goalComb});
  final GoalComb goalComb;

  static String id = 'honeycomb_screen';

  @override
  State<HoneycombScreen> createState() => _HoneycombScreenState();
}

class _HoneycombScreenState extends State<HoneycombScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const Center(child: Text('Goal Title')),
          Center(child: Text(widget.goalComb.goalTitle)),
          Center(child: Text('${widget.goalComb.goalIndex}')),
          Center(
            child: RegularButton(
              text: 'Delete',
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
