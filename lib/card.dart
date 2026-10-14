import 'package:flutter/material.dart';

class Mycard extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              color: Colors.white,
              elevation: 10,

              child: Padding(
                padding: const EdgeInsetsGeometry.all(30),
                child: Text(
                  "Hello Flutter",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 23,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
