import 'package:flutter/material.dart';

class Layoutbuilder extends StatelessWidget {
  const Layoutbuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LayoutBuilder(
          builder: (context, constrains) {
            final width = constrains.maxWidth;
            final column = width < 600
                ? 2
                : width < 1000
                ? 3
                : 4;

            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: column,
                mainAxisExtent: 214,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.85,
              ),
              itemBuilder: (context, index) {
                return Card(
                  child: Center(
                    child: Text(
                      "Products ${index + 1}",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
