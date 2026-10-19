import 'package:flutter/material.dart';
import 'package:new_flutter_project/widgets/typography/typhography.dart';

class BottomSheetDart extends StatelessWidget {
  const BottomSheetDart({super.key});

  @override
  Widget build(BuildContext context) {
    void showOptionsDart(BuildContext context) {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
            child: Padding(
              padding: EdgeInsets.all(18),
              child: Column(
                children: [
                  Text(
                    "Product Options Practice",
                    style: AppTypography.titleMedium,
                  ),
                  SizedBox(height: 16),
                  ListTile(
                    leading: Icon(Icons.favorite_outline),

                    title: Text(
                      "Add to favourite",
                      style: AppTypography.titleSmall,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.share_outlined),
                    title: Text(
                      "Share to others",
                      style: AppTypography.titleSmall,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.motorcycle_outlined),
                    title: Text(
                      "Ride a motorbike",
                      style: AppTypography.titleSmall,
                    ),
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
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              FilledButton(
                onPressed: () => showOptionsDart(context),
                child: Text(
                  "Show all features",
                  style: AppTypography.titleMedium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
