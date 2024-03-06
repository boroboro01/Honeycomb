import 'package:comb/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseFirestore _firestore = FirebaseFirestore.instance;

class Objectcomb extends StatefulWidget {
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
  State<Objectcomb> createState() => _ObjectcombState();
}

class _ObjectcombState extends State<Objectcomb> {
  final _auth = FirebaseAuth.instance;

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
          onPressed: () => widget.onPressed,
          child: Text(
            widget.objectName,
          ),
        ),
      ),
    );
  }
}
