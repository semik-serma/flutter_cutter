import 'package:flutter/material.dart';

class FullScreenDialogDartFlutter extends StatelessWidget {
  const FullScreenDialogDartFlutter({super.key});

  @override
  Widget build(BuildContext context) {
    void openFullScreenDialog(BuildContext context) {
      showDialog<void>(
        context: context,
        builder: (dialogContext) {
          return Dialog.fullscreen(
            child: Scaffold(
              appBar: AppBar(title: const Text("Full Screen")),
              body: Padding(
                padding: EdgeInsetsGeometry.all(24),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(labelText: "Full Name"),
                    ),
                    SizedBox(height: 16),
                    TextField(decoration: InputDecoration(labelText: "Email")),
                  ],
                ),
              ),
            ),
          );
        },
      );
    }

    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () => openFullScreenDialog(context),
          child: const Text("Full Screen Dialog"),
        ),
      ),
    );
  }
}
