import 'package:flutter/material.dart';
import 'package:hive_to_do/components/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.purple,
      content: Container(
        height: 150,
        child: Column(
          children: [
            // Input Text
            TextField(
              controller: controller,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Add new task"),
            ),
            // Adding some space
            const SizedBox(height: 10),
            // Add buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Cancel button
                MyButtons(buttonText: "Cancel", onPressed: onCancel),

                // Save button
                MyButtons(buttonText: "Save", onPressed: onSave),
              ],
            )
          ],
        ),
      ),
    );
  }
}
