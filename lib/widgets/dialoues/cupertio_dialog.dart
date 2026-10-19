import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_flutter_project/widgets/typography/typhography.dart';

class CupertinoDialogDart extends StatelessWidget {
  const CupertinoDialogDart({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void> showCupertinoDialogWidget(BuildContext context) async {
      showCupertinoDialog(
        context: context,
        builder: (BuildContext dialogContext) {
          return CupertinoAlertDialog(
            title: Text("Delete Account", style: AppTypography.titleMedium),
            content: Text("This Action cannot be undone"),
            actions: [
              CupertinoDialogAction(
                child: const Text("Cancel"),
                onPressed: () {
                  Navigator.pop(dialogContext, false);
                },
              ),
              CupertinoDialogAction(
                child: Text("Delete"),
                isDestructiveAction: true,
                onPressed: () {
                  Navigator.pop(dialogContext);
                },
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      body: Center(
        child: FilledButton(
          onPressed: () => showCupertinoDialogWidget(context),
          child: const Text("Delete this item"),
        ),
      ),
    );
  }
}
