import 'package:flutter/material.dart';

class AlertLogDialogDart extends StatelessWidget {
  const AlertLogDialogDart({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void> showDialogDart(BuildContext context) async {
      final bool? onPressedDialog = await showDialog<bool>(
        context: context,
        builder: (BuildContext showDialog) {
          return AlertDialog(
            title: Text("Delete this note!"),
            content: Text("Are you sure you want to delete this note"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(showDialog, true);
                },
                child: Text("Yes"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(showDialog, false);
                },
                child: Text("No"),
              ),
            ],
          );
        },
      );
      if (onPressedDialog == true) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Note Deleted Successfully")));
      }
    }

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FilledButton(
                onPressed: () => showDialogDart(context),
                child: Text("Press me"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
