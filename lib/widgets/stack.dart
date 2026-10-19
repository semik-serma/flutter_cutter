import 'package:flutter/material.dart';

class Mystack extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                const Card(
                  shadowColor: Colors.black87,
                  color: Colors.black,
                  child: Padding(padding: EdgeInsetsGeometry.all(120)),
                ),
                Center(
                  child: Icon(
                    Icons.gamepad_rounded,
                    color: Colors.white,
                    size: 70,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
