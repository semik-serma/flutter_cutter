import 'package:flutter/material.dart';

class MyFlutterPro extends StatefulWidget {
  const new({super.key});

  @override
  State<MyFlutterPro> createState() => _MyFlutterProState();
}

class _MyFlutterProState extends State<MyFlutterPro>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<double> scale;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..repeat(reverse: true);
    scale = Tween<double>(
      begin: 0.8,
      end: 0.10,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: scale,
      child: Icon(Icons.favorite, color: Colors.red, size: 30),
    );
  }
}
