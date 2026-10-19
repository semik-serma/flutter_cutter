import 'package:flutter/material.dart';
import 'package:new_flutter_project/widgets/animation/second_screen.dart';

class MyFirstPage extends StatefulWidget {
  const new({super.key});

  @override
  State<MyFirstPage> createState() => _MyFirstPageState();
}

class _MyFirstPageState extends State<MyFirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onDoubleTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => SecondScreen()),
            );
          },
          child: Hero(
            tag: Text("Product Name"),
            child: Image.network(
              'https://i.pinimg.com/736x/f7/24/55/f72455db7a64255666831031e4357e39.jpg',
              width: 400,
              height: 400,
            ),
          ),
        ),
      ),
    );
  }
}
