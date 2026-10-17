import 'package:flutter/material.dart';

class FilledButtonDart extends StatelessWidget {
  const FilledButtonDart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton(onPressed: () {}, child: const Text("Login Button")),
            SizedBox(height: 12),
            FilledButton.icon(
              onPressed: () {},
              icon: Icon(Icons.abc),
              label: Text("Click Here"),
            ),
            SizedBox(height: 12),
            FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
              onPressed: () {},
              child: Text("Save Changes"),
            ),
          ],
        ),
      ),
    );
  }
}
