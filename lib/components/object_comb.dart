import 'package:comb/constants.dart';
import 'package:flutter/material.dart';

class Objectcomb extends StatelessWidget {
  Objectcomb({
    super.key,
    required this.objectName,
    required this.objectCompleted,
    required this.onPressed,
  });

  final String objectName;
  final bool objectCompleted;
  Function(bool?)? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 25.0,
        right: 25.0,
        top: 25.0,
      ),
      child: Material(
        borderRadius: BorderRadius.circular(8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(24.0),
          ),
          onPressed: () => onPressed,
          child: Text(
            objectName,
          ),
        ),
      ),
    );
  }
}
