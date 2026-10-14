import 'package:flutter/material.dart';

class Listview extends StatefulWidget {
  const Listview({super.key});

  @override
  State<Listview> createState() => _ListviewState();
}

class _ListviewState extends State<Listview> {
  final List<int> numbers = [1, 2, 3, 4, 5, 6];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
          itemCount: 100,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Icon(Icons.person_add),
              title: Text("Hello flutter"),
            );
          },
        ),
      ),
    );
  }
}
