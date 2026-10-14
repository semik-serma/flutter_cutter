import 'package:flutter/material.dart';

class Detailscreen extends StatelessWidget {
  final String productName;
  final int productPrice;
  final String? deliveryAddress;
  Detailscreen({
    super.key,
    required this.productName,
    required this.productPrice,
    this.deliveryAddress = "Phidim",
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Details"))),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/mystack');
              },

              child: Text("Stack Screen"),
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/sliverscreen');
              },
              child: Text("Sliver Screen"),
            ),
            Container(
              child: Container(
                child: Container(
                  child: Container(
                    child: Column(
                      children: [Text(productName), Text("$productPrice")],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
