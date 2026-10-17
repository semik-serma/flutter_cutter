import 'package:flutter/material.dart';

class AnimationsFlutter extends StatefulWidget {
  const new({super.key});

  @override
  State<AnimationsFlutter> createState() => _AnimationsFlutterState();
}

class _AnimationsFlutterState extends State<AnimationsFlutter> {
  final bool expanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AnimatedContainer(
                color: Colors.blue,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                padding: EdgeInsets.all(100),
                constraints: BoxConstraints(
                  maxHeight: 400,
                  minHeight: 240,
                  maxWidth: 400,
                  minWidth: 240,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
