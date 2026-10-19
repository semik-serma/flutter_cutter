import 'package:flutter/material.dart';

class WrapChip extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center()),
      body: Padding(
        padding: EdgeInsetsGeometry.only(top: 30),
        child: Wrap(
          spacing: 10,
          children: [
            // Chip(label: Text("fulai")),
            // Chip(label: Text("ful")),
            // Chip(label: Text("ko")),
            // Chip(label: Text("bagaicha")),
            // Chip(label: Text("ma")),
            // Chip(label: Text("meri")),
            // Chip(label: Text("maya")),
          ],
        ),
      ),
    );
  }
}
