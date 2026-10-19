import 'package:flutter/material.dart';

class DialogScreen extends StatelessWidget {
  const DialogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void showDeletedDialog(BuildContext context) async {
      final bool? shouldDelete = await showDialog<bool>(
        context: context,
        builder: (BuildContext dialogContext) {
          return AlertDialog(
            title: const Text("Delete Note"),
            content: const Text("Are you sure you want to delete this note"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(dialogContext, true);
                },
                child: const Text("Yes"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(dialogContext, false);
                },
                child: const Text("No"),
              ),
            ],
          );
        },
      );
      if (shouldDelete == true && context.mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Note Deleted")));
      }
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FilledButton(
                  onPressed: () => showDeletedDialog(context),
                  child: const Text("Delete this item"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
