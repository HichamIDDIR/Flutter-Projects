import 'package:flutter/material.dart';
import 'package:todo_app/components/my_button.dart';

// ignore: must_be_immutable
class dialog_box extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  dialog_box({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color.fromARGB(202, 255, 255, 255),
      content: Container(
        padding: EdgeInsets.all(16.0),

        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //get user input
            TextField(
              controller: controller,
              decoration: InputDecoration(
                labelText: 'New Task',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // save button
                TheButton(the_task: "Save", onPressed: onSave),

                const SizedBox(width: 10.0),
                // cancel button
                TheButton(the_task: "cancle", onPressed: onCancel),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
