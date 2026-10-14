import 'package:flutter/material.dart';

class ViperInteraction extends StatelessWidget {
  const ViperInteraction({super.key});
  @override
  void greet([String name = "Janga Bahadur"]) {
    debugPrint("$name, Good Morning");
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            OutlinedButton(
              onPressed: () => greet("yellow"),
              child: Text("Greet me"),
            ),
            Material(),
          ],
        ),
      ),
    );
  }
}
