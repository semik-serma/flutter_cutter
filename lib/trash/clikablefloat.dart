import 'package:flutter/material.dart';

class ClikableFloat extends StatefulWidget {
  const new({super.key});

  @override
  State<ClikableFloat> createState() => _ClikableFloatState();
}

class _ClikableFloatState extends State<ClikableFloat> {
  int i = 0;
  void floatclick() {
    setState(() {
      i++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Column(
            children: [
              Text(
                "Day 5 of flutter learning",
                style: TextStyle(
                  color: const Color.fromARGB(255, 1, 108, 4),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsetsGeometry.all(50),
              child: Column(
                children: [
                  OutlinedButton(
                    onPressed: floatclick,
                    child: Text("Clike me"),
                  ),
                  Text("$i"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
