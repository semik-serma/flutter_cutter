import 'package:flutter/material.dart';

class GridDelexure extends StatelessWidget {
  const GridDelexure({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> product = ["laptop", "mobile", "computer"];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome to grid practice arena"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: 10,
                crossAxisSpacing: 9,
                childAspectRatio: 0.8,
              ),
              itemCount: product.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Center(
                    child: Text(
                      product[index],
                      style: const TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
