import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// ignore: must_be_immutable
class TheTile extends StatelessWidget {
  final String name_of_task;
  final bool check_of_task;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  TheTile({
    super.key,
    required this.name_of_task,
    required this.check_of_task,
    required this.onChanged,
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.deepPurple.shade300,
              borderRadius: BorderRadius.circular(12),
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(17.5),
          decoration: BoxDecoration(
            color: Colors.deepPurple[100],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              // The check box
              Checkbox(
                value: check_of_task,
                onChanged: onChanged,
                activeColor: Colors.deepPurpleAccent,
              ),

              // The task name
              Text(
                name_of_task,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  decoration: check_of_task ? TextDecoration.lineThrough : null,
                  decorationColor: Colors.deepPurpleAccent,
                  decorationThickness: 2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
