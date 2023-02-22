import 'package:flutter/material.dart';
import 'package:moda_app/pages/HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final ThemeData theme = ThemeData();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Moda App',
      theme: theme.copyWith(
          colorScheme: theme.colorScheme.copyWith(
              secondary: Colors.black54,
              primary: Colors.blue.shade400,
              background: Colors.blue.shade400)),
      home:const HomePage(),
    );
  }
}
