// import 'dart:collection';
// import 'package:comb/resources/goal.dart';
// import 'package:flutter/material.dart';

// class GoalData extends ChangeNotifier {
//   final List<Goal> _goals = [
//     Goal(name: 'Object1'),
//     Goal(name: 'Object2'),
//   ];

//   UnmodifiableListView<Goal> get goals {
//     return UnmodifiableListView(_goals);
//   }

//   int get goalCount {
//     return _goals.length;
//   }

//   void addGoal(String newGoalTitle) {
//     final goal = Goal(name: newGoalTitle);
//     _goals.add(goal);
//     notifyListeners();
//   }

//   void deleteGoal(Goal goal) {
//     _goals.remove(goal);
//     notifyListeners();
//   }
// }
