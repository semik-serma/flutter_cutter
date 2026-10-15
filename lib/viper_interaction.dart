import 'package:flutter/material.dart';

class ViperInteraction extends StatelessWidget {
  const ViperInteraction({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                GestureDetector(
                  child: Container(
                    color: Colors.blue,
                    padding: EdgeInsets.all(10),
                    child: Text("tap me"),
                  ),
                  onTap: () {
                    debugPrint("User tapped");
                  },
                  onDoubleTap: () {
                    debugPrint("User double tapped");
                  },
                  onLongPress: () {
                    debugPrint("long pressed");
                  },
                  onDoubleTapCancel: () {
                    debugPrint("Double tap canceled");
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
