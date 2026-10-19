import 'package:flutter/material.dart';
import 'package:new_flutter_project/widgets/typography/typhography.dart';

class DoctorCardDart extends StatelessWidget {
  const DoctorCardDart({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: EdgeInsetsGeometry.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Row(
              children: [
                CircleAvatar(child: Icon(Icons.person), radius: 50),
                SizedBox(height: 12),
              ],
            ),
            SizedBox(width: 2),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Dr Sharma",
                    style: AppTypography.displayLarge.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text("Cardiologist", style: TextStyle(color: Colors.red)),
                ],
              ),
            ),
            SizedBox(height: 16),
            const Text("Available 10:00AM-2:00"),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () {},
                child: const Text(
                  "Book Apointment",
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
