import 'package:flutter/material.dart';

class Yellow_Page_App extends StatelessWidget {
  const Yellow_Page_App({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Yellow_Page_App"),
          backgroundColor: Colors.yellow.shade200),
      body: Center(
        child: Text(
          "Yellow Page",
          style: TextStyle(fontSize: 36),
        ),
      ),
    );
  }
}
