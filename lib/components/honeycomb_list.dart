import 'package:comb/components/object_comb.dart';
import 'package:flutter/material.dart';
import 'dialog_box.dart';

class HoneycombList extends StatefulWidget {
  const HoneycombList({super.key});

  @override
  State<HoneycombList> createState() => _HoneycombListState();
}

class _HoneycombListState extends State<HoneycombList> {
  final _controller = TextEditingController();

  List objectList = [
    ["Object1", true],
    ["Object2", false],
  ];

  void saveNewObject() {
    setState(() {
      objectList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  void createNewObject() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewObject,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: createNewObject,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: objectList.length,
        itemBuilder: (context, index) {
          return Objectcomb(
            objectName: objectList[index][0],
            objectCompleted: objectList[index][1],
            onPressed: (p0) {},
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
