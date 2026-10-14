import 'package:flutter/material.dart';
import 'package:new_flutter_project/navigate/detailscreen.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Semik")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) =>
                    Detailscreen(productName: "Mero Laptop", productPrice: 123),
              ),
            );
          },
          child: Icon(Icons.accessible_sharp),
        ),
      ),
    );
  }
}
