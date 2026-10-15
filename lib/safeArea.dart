import 'package:flutter/material.dart';

class SafeAreaWidget extends StatelessWidget {
  const SafeAreaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(120),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(height: 200, color: Colors.blue.shade600),
              SizedBox(height: 10),
              Container(
                height: 200,
                color: const Color.fromARGB(255, 38, 0, 255),
              ),
              SizedBox(height: 10),
              Container(
                height: 200,
                color: const Color.fromARGB(255, 93, 236, 5),
              ),
              SizedBox(height: 10),
              Container(
                height: 200,
                color: const Color.fromARGB(255, 247, 3, 36),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
