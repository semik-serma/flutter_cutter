import 'package:flutter/material.dart';

enum ViewMode { grid, list }

class SegmentedButtonDartFlutter extends StatefulWidget {
  const SegmentedButtonDartFlutter({super.key});

  @override
  State<SegmentedButtonDartFlutter> createState() =>
      _SegmentedButtonDartFlutterState();
}

class _SegmentedButtonDartFlutterState
    extends State<SegmentedButtonDartFlutter> {
  @override
  Widget build(BuildContext context) {
    ViewMode selectedMode = ViewMode.grid;
    return Scaffold(
      appBar: AppBar(title: Text("Segmented Button")),
      body: Padding(
        padding: const EdgeInsetsGeometry.all(8.0),

        child: Column(
          children: [
            SegmentedButton<String>(
              multiSelectionEnabled: true,
              emptySelectionAllowed: true,
              segments: const [
                ButtonSegment(value: "Music", label: Text("Music")),
              ],
              selected: const {'music', 'technology'},
              onSelectionChanged: (selection) {
                print(selection);
              },
            ),
            SizedBox(height: 12),
            SegmentedButton<ViewMode>(
              segments: const [
                ButtonSegment<ViewMode>(
                  value: ViewMode.grid,
                  label: Text("Grid"),
                  icon: Icon(Icons.grid_view),
                ),
                ButtonSegment<ViewMode>(
                  value: ViewMode.list,
                  label: Text("List"),
                  icon: Icon(Icons.list),
                ),
              ],
              selected: {selectedMode},
              onSelectionChanged: (Set<ViewMode> newSelection) {
                setState(() {
                  selectedMode = newSelection.first;
                });
              },
            ),
            const SizedBox(height: 24),
            Expanded(
              child: Center(
                child: Text(
                  selectedMode == ViewMode.grid ? "Grid View" : "List View",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
