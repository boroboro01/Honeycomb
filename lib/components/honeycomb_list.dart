import 'package:comb/components/object_comb.dart';
import 'package:flutter/material.dart';

class HoneycombList extends StatefulWidget {
  const HoneycombList({super.key});

  @override
  State<HoneycombList> createState() => _HoneycombListState();
}

class _HoneycombListState extends State<HoneycombList> {
  List objectList = [
    ["Object1", true],
    ["Object2", false],
  ];

  void createNewObject() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog();
      },
    );
  }

  void checkBoxChanged(bool? value, int index) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          createNewObject;
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: objectList.length,
        itemBuilder: (context, index) {
          return Objectcomb(
            objectName: objectList[index][0],
            objectCompleted: objectList[index][1],
            onPressed: (value) => checkBoxChanged(value, index),
          );
        },
      ),
    );
  }
}

// FloatingActionButton(
//                   onPressed: () {},
//                   child: const Icon(Icons.add),
//                 ),
