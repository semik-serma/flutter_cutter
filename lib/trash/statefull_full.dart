import 'package:flutter/material.dart';

class Statefullpage extends StatefulWidget {
  const new({super.key});

  @override
  State<Statefullpage> createState() => _StatefullpageState();
}

class _StatefullpageState extends State<Statefullpage> {
  int counter = 0;
  void increment() {
    setState(() {
      counter++;
    });
  }

  @override
  void initState() {
    super.initState();
    debugPrint("Initailzed");
  }

  @override
  void deactivate() {
    debugPrint("Deactivate");
    super.deactivate();
  }

  @override
  void dispose() {
    debugPrint("Dispose");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Counter $counter")),
      body: Center(
        child: Column(
          children: [
            Text(
              "$counter",
              style: TextStyle(color: Colors.black38, fontSize: 28),
            ),
            ElevatedButton(
              onPressed: () => (increment()),
              child: Text("Increment"),
            ),
            OutlinedButton(onPressed: dispose, child: Text("Dispose")),
          ],
        ),
      ),
    );
  }
}

// class TimerLabel extends StatefulWidget {
//   const new({super.key});

//   @override
//   State<TimerLabel> createState() => _TimerLabelState();
// }

// class _TimerLabelState extends State<TimerLabel> {
//   @override
//   void initState() {
//     super.initState();
//     debugPrint("Initailzed");
//   }

//   @override
//   void deactivate() {
//     debugPrint("Deactivate");
//     super.deactivate();
//   }

//   @override
//   void dispose() {
//     debugPrint("Dispose");
//     super.dispose();
//   }

//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Text("Ready"),
//           TextButton(onPressed: deactivate, child: Text("Hello world")),
//         ],
//       ),
//     );
//   }
// }
