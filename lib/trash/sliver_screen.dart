import 'package:flutter/material.dart';

class SliverScreen extends StatelessWidget {
  const SliverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          title: Text("Explore"),
          pinned: true,
          expandedHeight: 180,
          flexibleSpace: FlexibleSpaceBar(
            background: ColoredBox(color: Colors.cyan),
          ),
        ),
        SliverPadding(
          padding: EdgeInsetsGeometry.all(18),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Card(child: Center(child: Text("Item $index")));
            }),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            ListTile(title: Text("Recent Activity")),
            ListTile(title: Text("Inventory")),
          ]),
        ),
      ],
    );
  }
}
