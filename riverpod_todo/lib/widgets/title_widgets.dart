import 'package:flutter/material.dart';

class TitleWidgets extends StatelessWidget {
  const TitleWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('Todo App',
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.orange, fontSize: 80, fontWeight: FontWeight.bold));
  }
}
