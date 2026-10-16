import 'package:flutter/material.dart';

class UserInteraction extends StatelessWidget {
  const UserInteraction({super.key});

  @override
  Widget build(BuildContext context) {
    void showMessage() {
      debugPrint("Button Pressed");
    }

    void greet(String name) {
      debugPrint("Hello $name");
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsetsGeometry.all(40.0),
        child: Column(
          children: [
            GestureDetector(
              child: Container(
                color: Colors.blue,
                padding: const EdgeInsets.all(8),
                child: Text("Tap Me", style: TextStyle(color: Colors.white)),
              ),
              onTap: () {
                debugPrint("Tapped");
              },
              onDoubleTap: () {
                debugPrint("Double Tapped");
              },
              onLongPress: () {
                debugPrint("Long pressed");
              },
              onTapCancel: () {
                debugPrint("On tapped cancel");
              },
            ),
            Material(
              color: Colors.black12,
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () {
                  debugPrint("Card Tapped");
                },
                child: Padding(
                  padding: EdgeInsetsGeometry.all(16),
                  child: Text("Hello Text"),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: showMessage,
              child: Text("Elevated Submit"),
            ),
            TextButton(
              onPressed: () => greet("Semik"),
              child: Text("Text Button"),
            ),
            OutlinedButton(
              onPressed: () => greet("gyan"),
              child: Text("Out lined Submit"),
            ),
            IconButton(
              onPressed: () => greet("Bike"),
              icon: Icon(Icons.pedal_bike),
            ),
            FloatingActionButton(
              onPressed: () => greet("Hello"),
              child: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
