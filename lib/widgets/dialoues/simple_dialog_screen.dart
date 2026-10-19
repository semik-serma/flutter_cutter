import 'package:flutter/material.dart';
import 'package:new_flutter_project/widgets/typography/typhography.dart';

class SimpleDialogScreenDart extends StatelessWidget {
  const SimpleDialogScreenDart({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void> showLanguageOptions(BuildContext context) async {
      final String? language = await showDialog(
        context: context,
        builder: (BuildContext dialogContext) {
          return SimpleDialog(
            title: Text("Choose Language"),

            children: [
              SimpleDialogOption(
                child: Text("English"),
                onPressed: () {
                  Navigator.pop(dialogContext, "English");
                },
              ),
              SimpleDialogOption(
                child: const Text("Nepali"),
                onPressed: () {
                  Navigator.pop(dialogContext, "Nepali");
                },
              ),
              SimpleDialogOption(
                child: Text("hindi urdu"),
                onPressed: () {
                  Navigator.pop(dialogContext, "Hindi");
                },
              ),
            ],
          );
        },
      );
      if (language != null) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("${language} is selected")));
      }
    }

    Future<void> showCustumDialog(BuildContext context) {
      return showDialog(
        context: context,
        builder: (BuildContext dialogContext) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.shopping_bag, size: 48),
                  SizedBox(height: 16),
                  Text("Product Added", style: AppTypography.titleMedium),
                  const SizedBox(height: 16),
                  Text(
                    "Your Product has been added to cart",
                    style: AppTypography.bodySmall,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  FilledButton(
                    onPressed: () {
                      Navigator.pop(dialogContext);
                    },
                    child: Text("Continue"),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    void showAppInformation(BuildContext context) {
      showAboutDialog(
        context: context,
        applicationName: "My Ecommerce Website",
        applicationIcon: Icon(Icons.abc),
        applicationVersion: '1.0.0',
        applicationLegalese: "@2026 ABC Company",
      );
    }

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () => showAppInformation(context),
              child: Text("About Dialog"),
            ),
            FilledButton(
              onPressed: () => showLanguageOptions(context),
              child: const Text("Delete Note"),
            ),
            FilledButton(
              onPressed: () => showCustumDialog(context),
              child: const Text("Custom Dialog"),
            ),
          ],
        ),
      ),
    );
  }
}
