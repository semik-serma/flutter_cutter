import 'package:flutter/material.dart';

class ContsTrainedBox extends StatelessWidget {
  const ContsTrainedBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: 200,
            maxHeight: 400,
            maxWidth: 200,
            minHeight: 400,
          ),
          child: Container(
            color: Colors.blue,
            child: Center(
              child: Text(
                "Constrained Box",
                style: TextStyle(
                  fontFamily: "dm_sans.ttf",
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
