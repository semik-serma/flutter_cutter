import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Column(
            children: [
              IconButton(
                tooltip: "Disable Sound",
                onPressed: () {},
                icon: Icon(
                  Icons.hearing_disabled,
                  color: Colors.white30,
                  size: 50,
                ),
              ),
              SizedBox(height: 300, width: double.infinity),
              Hero(
                tag: Text("Gojo Saturo"),
                child: Image.network(
                  'https://i.pinimg.com/736x/78/ad/b2/78adb2906f652b82c49d02bc067faeee.jpg',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
