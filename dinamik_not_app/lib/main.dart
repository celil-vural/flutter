import 'package:dinamik_not_app/constants/app_constants.dart';
import 'package:dinamik_not_app/widgets/calculateAveragePage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dinamik Not Hesapla',
      theme: ThemeData(primarySwatch:Constants.mainColor,visualDensity: VisualDensity.adaptivePlatformDensity),
      home: CalculateAverage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
