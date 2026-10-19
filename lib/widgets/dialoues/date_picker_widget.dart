import 'package:flutter/material.dart';

class DatePickerWidgetDart extends StatelessWidget {
  const DatePickerWidgetDart({super.key});

  Future<void> selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2012),
      lastDate: DateTime(2030),
    );

    if (pickedDate != null) {
      debugPrint("Selected Date: $pickedDate");

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Your selected date is $pickedDate")),
      );
    }
  }

  Future<void> selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null && context.mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Your Selected Time $pickedTime")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flutter Date Picker")),
      body: Center(
        child: Column(
          children: [
            FilledButton.icon(
              onPressed: () => selectDate(context),
              icon: const Icon(Icons.calendar_month),
              label: const Text("Select Date"),
            ),
            FilledButton.icon(
              onPressed: () => selectTime(context),
              icon: const Icon(Icons.calendar_month),
              label: const Text("Select Date"),
            ),
            FilledButton(
              onPressed: () {
                showAdaptiveDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog.adaptive(
                      title: Text("Confirm Action"),
                      content: Text("Do you want to continue"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("Continue"),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("Cancel"),
                        ),
                        TextButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Hellow semik"),
                                  content: Text("Welcome"),
                                );
                              },
                            );
                          },
                          child: Text("Welcome to flutter"),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text("Continue"),
            ),
          ],
        ),
      ),
    );
  }
}
