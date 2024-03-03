import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comb/components/text_box.dart';
import 'package:comb/constants.dart';
import 'package:comb/screeens/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

FirebaseFirestore _firestore = FirebaseFirestore.instance;

class PersonalPage extends StatefulWidget {
  const PersonalPage({super.key});

  @override
  State<PersonalPage> createState() => _PersonalPageState();
}

class _PersonalPageState extends State<PersonalPage> {
  final _auth = FirebaseAuth.instance;
  final userCollection = _firestore.collection('Users');
  final currentUser = FirebaseAuth.instance.currentUser!;

  //edit field
  Future<void> editField(String field) async {
    String newValue = '';
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey[100],
        title: Text(
          "Edit $field",
          style: const TextStyle(color: Colors.black),
        ),
        content: TextField(
          autofocus: true,
          style: const TextStyle(color: Colors.black),
          decoration: InputDecoration(
            hintText: "Enter new $field",
            hintStyle: const TextStyle(color: Colors.grey),
          ),
          onChanged: (value) {
            newValue = value;
          },
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(newValue),
            child: const Text('Submit'),
          ),
        ],
      ),
    );
    if (newValue.trim().isNotEmpty) {
      await userCollection.doc(currentUser.email).update({field: newValue});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<DocumentSnapshot>(
        stream:
            _firestore.collection('Users').doc(currentUser.email).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final userData = snapshot.data!.data() as Map<String, dynamic>;

            return ListView(
              children: [
                const SizedBox(
                  height: 50.0,
                ),
                const Icon(
                  Icons.person,
                  size: 100.0,
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Text(
                  currentUser.email!,
                  textAlign: TextAlign.center,
                  style: kSmallText.copyWith(color: Colors.grey[800]),
                ),
                const SizedBox(
                  height: 50.0,
                ),
                MyTextBox(
                  sectionName: 'username',
                  text: userData['username'],
                  onPressed: () => editField('username'),
                ),
                MyTextBox(
                  sectionName: 'empty bio',
                  text: userData['bio'],
                  onPressed: () => editField('bio'),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[200],
                    ),
                    onPressed: () {
                      _auth.signOut();
                      Navigator.pushNamedAndRemoveUntil(
                          context, WelcomeScreen.id, (route) => false);
                    },
                    child: const Text(
                      'Logout',
                      style: TextStyle(
                          color: mediumComb,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error${snapshot.error}'),
            );
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
