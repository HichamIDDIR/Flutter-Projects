import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TheButton extends StatelessWidget {
  final String the_task;
  VoidCallback? onPressed;
  TheButton({super.key, required this.the_task, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 49,
      onPressed: onPressed,
      child: Text(the_task),
      color: Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
    );
  }
}
