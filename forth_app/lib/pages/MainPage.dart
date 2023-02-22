import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) {
      return ExpansionTile(
        key: PageStorageKey("$index"),
        title: Text(index.toString()),
        children: [
          Container(
            color: Colors.blue.shade200,
            height: 150,
          )
        ],
      );
    });
  }
}
