import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: () {}, child: Text("I love you")),
            OutlinedButton(onPressed: () {}, child: Text("I hate you")),
            TextButton(onPressed: () {}, child: Text("I am the super cian")),
            FloatingActionButton(
              onPressed: () {},
              child: Text("Hello My bean"),
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.add_circle_outlined)),
          ],
        ),
      ),
    );
  }
}
