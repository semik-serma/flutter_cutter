import 'package:flutter/material.dart';

class Gridviewpage extends StatelessWidget {
  const Gridviewpage({super.key});

  @override
  Widget build(BuildContext context) {
    final product = [
      "Laptop",
      "Mobile",
      "Tablet",
      "Desktop",
      "Smartwatch",
      "Camera",
    ];
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 0.8,
          ),
          // gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          //   maxCrossAxisExtent: 500,
          //   crossAxisSpacing: 12,
          //   mainAxisSpacing: 12,
          //   childAspectRatio: 0.8,
          // ),
          itemCount: product.length,
          itemBuilder: (context, index) {
            return Card(child: Center(child: Text(product[index])));
          },
        ),
      ),
    );
  }
}
