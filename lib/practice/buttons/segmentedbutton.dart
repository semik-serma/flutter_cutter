import 'package:flutter/material.dart';

class SegmentedExample extends StatefulWidget {
  const SegmentedExample({super.key});

  @override
  State<SegmentedExample> createState() => _SegmentedExampleState();
}

class _SegmentedExampleState extends State<SegmentedExample> {
  String selectedOption = 'Home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Segmented Button')),

      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SegmentedButton<String>(
              segments: const [
                ButtonSegment(
                  value: 'Home',
                  label: Text('Home'),
                  icon: Icon(Icons.home),
                ),
                ButtonSegment(
                  value: 'Search',
                  label: Text('Search'),
                  icon: Icon(Icons.search),
                ),
                ButtonSegment(
                  value: 'Profile',
                  label: Text('Profile'),
                  icon: Icon(Icons.person),
                ),
              ],

              selected: {selectedOption},

              onSelectionChanged: (newSelection) {
                setState(() {
                  selectedOption = newSelection.first;
                });
              },
            ),

            const SizedBox(height: 30),

            Text(
              'Selected: $selectedOption',
              style: const TextStyle(fontSize: 22),
            ),
          ],
        ),
      ),
    );
  }
}
