import 'package:flutter/material.dart';

class LastUpdateWidget extends StatelessWidget {
  const LastUpdateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Last Updated:${TimeOfDay.now().format(context).toString()}',
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }
}
