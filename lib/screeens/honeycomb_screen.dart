import 'package:comb/components/regular_button.dart';
import 'package:comb/components/goal_comb.dart';
import 'package:comb/resources/goal_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
          const Center(child: Text('Goal Name')),
          Center(child: Text(widget.goalComb.goalName)),
          Center(child: Text('${widget.goalComb.goalNumber}')),
          Center(
            child: RegularButton(
              text: 'Delete',
              onPressed: () {
                widget.goalComb.deleteCallback();
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
