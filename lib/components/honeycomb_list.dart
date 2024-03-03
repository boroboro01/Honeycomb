import 'package:comb/screeens/shelf_screen.dart';
import 'package:flutter/material.dart';

class honeycombList extends StatelessWidget {
  const honeycombList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
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
    );
  }
}
