import 'package:comb/screeens/honeycomb_list.dart';
import 'package:comb/screeens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:comb/constants.dart';

class ShelfScreen extends StatefulWidget {
  static String id = 'shelf_screen';

  const ShelfScreen({super.key});

  @override
  State<ShelfScreen> createState() => _ShelfScreenState();
}

class _ShelfScreenState extends State<ShelfScreen> {
  int currentPageIndex = 1;

  List<String> titles = ['Profile', 'Honeycomb', 'Settings'];

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
          backgroundColor: lightComb,
          title: Text(
            titles[currentPageIndex],
          ),
          actions: const []),
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.grey[400],
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: lightComb,
        selectedIndex: currentPageIndex,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'Personal',
          ),
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
      body: <Widget>[
        const PersonalPage(),
        const HoneycombList(),
        const Text('Settings Page'),
      ][currentPageIndex],
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
