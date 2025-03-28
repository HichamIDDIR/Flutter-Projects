import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  final String thetext;
  final IconData theicon;
  final void Function()? onTap;
  const MyListTile({
    super.key,
    required this.thetext,
    required this.theicon,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: ListTile(
        leading: Icon(theicon, color: Colors.grey),
        title: Text(thetext),
        onTap: onTap,
      ),
    );
  }
}
