import 'package:flutter/material.dart';

class SliverBar extends StatelessWidget {
  const SliverBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(title: const Text("Explore"), pinned: true),
        ],
        
      ),
    );
  }
}
