import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TheButton extends StatelessWidget {
  // ignore: non_constant_identifier_names
  final String the_task;
  VoidCallback? onPressed;
  // ignore: non_constant_identifier_names
  TheButton({super.key, required this.the_task, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 49,
      onPressed: onPressed,
      color: Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: Text(the_task),
    );
  }
}
