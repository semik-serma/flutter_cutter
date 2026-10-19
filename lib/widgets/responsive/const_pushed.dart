import 'package:flutter/material.dart';

class ConstrainedWidgetPractice extends StatelessWidget {
  const ConstrainedWidgetPractice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: 200,
                  minHeight: 140,
                  maxWidth: 200,
                  minWidth: 140,
                ),
                child: Column(
                  children: [
                    OutlinedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/mylayout");
                      },
                      child: Text(
                        "Go to layout_practice",
                        style: TextStyle(color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
