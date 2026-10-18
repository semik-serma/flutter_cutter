import 'package:flutter/material.dart';

class DialougesDart extends StatelessWidget {
  const DialougesDart({super.key});

  @override
  Widget build(BuildContext context) {
    void selctedDialouge(BuildContext context) async {
      final bool? shouldDelete = await showDialog<bool>(
        context: context,
        builder: (BuildContext dialogContext) {
          return AlertDialog(
            title: Text("Delete Item"),
            content: Text("Are you sure you want to delete this item"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(dialogContext, true);
                },
                child: Text("Yes"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(dialogContext, false);
                },
                child: Text("No"),
              ),
            ],
          );
        },
      );
      if (shouldDelete == true) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Item Deleted Successfully")));
      }
      if (shouldDelete == false) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Delte Canceled Successfully")),
        );
      }
    }

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => selctedDialouge(context),
                child: const Text("Delte this item"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
