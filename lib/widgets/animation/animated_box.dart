import 'package:flutter/material.dart';
import 'package:new_flutter_project/widgets/animation/animated_icon.dart';

//animatedOpacity  ------> fade elements in or out
//AnimatedAlign  -------->Animate aligment
//AnimatedPadding --------> animate padding
//animatedPosition -------->animatedPosition children in a stack
//animatedSwitcher --------> animate transitions between different child widgets
//TweenAnimationBuilder -------->animate a value between two endpoints
// if the content must stop receiving interactions while hidden, consider removing it from teh widget
//tree or controlling its interaction and accessibility separately. Opactiy alone doesn't make widget non-interactive

class AniimatedBox extends StatefulWidget {
  const AniimatedBox({super.key});

  @override
  State<AniimatedBox> createState() => _AniimatedBoxState();
}

class _AniimatedBoxState extends State<AniimatedBox> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("All Animated Widgets Demo")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MyFlutterPro(),
              SizedBox(height: 12),
              // 1. ANIMATED CONTAINER
              // Animates size, color, borderRadius together
              const Text(
                "AnimatedContainer",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                width: expanded ? 200 : 120,
                height: expanded ? 200 : 120,
                decoration: BoxDecoration(
                  color: expanded ? Colors.orange : Colors.blue,
                  borderRadius: BorderRadius.circular(expanded ? 30 : 8),
                ),
              ),

              const SizedBox(height: 30),

              // 2. ANIMATED OPACITY
              // Fades text in/out — wrapped with IgnorePointer so it
              // can't be tapped/focused while invisible
              const Text(
                "AnimatedOpacity",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              AnimatedOpacity(
                opacity: expanded ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeIn,
                child: IgnorePointer(
                  ignoring: !expanded,
                  child: ElevatedButton(
                    onPressed: () {
                      debugPrint("Hidden button tapped");
                    },
                    child: const Text("I fade in when expanded"),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // 3. ANIMATED ALIGN
              // Animates alignment of a child inside its available space
              const Text(
                "AnimatedAlign",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Container(
                height: 100,
                width: double.infinity,
                color: Colors.grey.shade300,
                child: AnimatedAlign(
                  alignment: expanded
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                  child: Container(width: 50, height: 50, color: Colors.green),
                ),
              ),

              const SizedBox(height: 30),

              // 4. ANIMATED PADDING
              // Animates the padding around a widget
              const Text(
                "AnimatedPadding",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Container(
                color: Colors.grey.shade300,
                child: AnimatedPadding(
                  padding: EdgeInsets.all(expanded ? 40 : 8),
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                  child: Container(color: Colors.purple, width: 60, height: 60),
                ),
              ),

              const SizedBox(height: 30),

              // 5. ANIMATED POSITIONED
              // Must live inside a Stack — animates top/left/width/height
              const Text(
                "AnimatedPositioned",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 150,
                width: double.infinity,
                child: Stack(
                  children: [
                    Container(color: Colors.grey.shade300),
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                      top: expanded ? 0 : 100,
                      left: expanded ? 200 : 0,
                      width: expanded ? 80 : 50,
                      height: expanded ? 80 : 50,
                      child: Container(color: Colors.redAccent),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // 6. ANIMATED SWITCHER
              // Animates the transition between two different widgets
              const Text(
                "AnimatedSwitcher",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                transitionBuilder: (child, animation) {
                  return ScaleTransition(scale: animation, child: child);
                },
                child: Icon(
                  expanded ? Icons.check_circle : Icons.circle_outlined,
                  key: ValueKey<bool>(expanded), // triggers the switch
                  size: 60,
                  color: expanded ? Colors.green : Colors.grey,
                ),
              ),

              const SizedBox(height: 30),

              // 7. TWEEN ANIMATION BUILDER
              // Animates a custom double value (rotation) between two points
              const Text(
                "TweenAnimationBuilder",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0, end: expanded ? 1 : 0),
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                builder: (context, value, child) {
                  return Transform.rotate(
                    angle: value * 3.14, // rotates up to 180 degrees
                    child: child,
                  );
                },
                child: Container(width: 60, height: 60, color: Colors.teal),
              ),

              const SizedBox(height: 40),

              ElevatedButton(
                onPressed: () {
                  setState(() {
                    expanded = !expanded;
                  });
                },
                child: const Text("Toggle Animation"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
