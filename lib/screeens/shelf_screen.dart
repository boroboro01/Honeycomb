import 'package:flutter/material.dart';
import 'package:comb/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ShelfScreen extends StatefulWidget {
  static String id = 'shelf_screen';

  const ShelfScreen({super.key});

  @override
  State<ShelfScreen> createState() => _ShelfScreenState();
}

class _ShelfScreenState extends State<ShelfScreen> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: lightComb,
          title: const Text(
            'Honeycomb',
          ),
          actions: const []),
      backgroundColor: lightHoney,
      body: SafeArea(
        child: Column(
          children: [
            const Expanded(
              child: Row(
                children: [
                  Text(
                    'Hoeny jar',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: ListView(
                children: const [
                  Honeycomb(
                    combName: 'Comb1',
                  ),
                  Honeycomb(
                    combName: 'Comb2',
                  ),
                  Honeycomb(
                    combName: 'Comb3',
                  ),
                  Honeycomb(
                    combName: 'Comb4',
                  ),
                  Honeycomb(
                    combName: 'Comb5',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: lightComb,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Personal',
            backgroundColor: lightComb,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: lightComb,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: lightComb,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: veryLightComb,
        onTap: _onItemTapped,
      ),
    );
  }
}

class Honeycomb extends StatelessWidget {
  const Honeycomb({
    super.key,
    required this.combName,
  });

  final String combName;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          color: lightComb,
          border: Border(
              bottom: BorderSide(
            color: veryLightComb,
          )),
        ),
        width: double.maxFinite,
        height: 150.0,
        child: Text(
          combName,
          style: kTitleDecoration,
        ),
      ),
    );
  }
}
