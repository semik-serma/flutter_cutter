import 'package:flutter/material.dart';
import 'package:new_flutter_project/widgets/typography/typhography.dart';

class BottomSheetScreen extends StatelessWidget {
  const BottomSheetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void showOptions(BuildContext context) {
      showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("product options", style: AppTypography.titleMedium),
                  const SizedBox(height: 16),
                  ListTile(
                    leading: const Icon(Icons.favorite_outline),
                    title: Text(
                      "Add To Favourite",
                      style: AppTypography.titleSmall,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.share),
                    title: Text("Share", style: AppTypography.titleSmall),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.report_outlined),
                    title: Text("Report", style: AppTypography.titleSmall),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text("Bottom Sheet")),
      body: Center(
        child: FilledButton(
          onPressed: () => showOptions(context),
          child: Text("More Options"),
        ),
      ),
    );
  }
}
