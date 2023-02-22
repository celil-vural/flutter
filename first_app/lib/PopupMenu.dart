import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class MyWidgetPopup extends StatelessWidget {
  const MyWidgetPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Dropdown",
      home: Scaffold(
          appBar: AppBar(
            title: Text(""),
            actions: [PopupMenu()],
          ),
          body: Center()),
      debugShowCheckedModeBanner: false,
    );
  }
}

class PopupMenu extends StatefulWidget {
  const PopupMenu({super.key});

  @override
  State<PopupMenu> createState() => _PopupMenuState();
}

class _PopupMenuState extends State<PopupMenu> {
  List<String> _menuItems = ["Item1", "Item2"];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: PopupMenuButton(
        itemBuilder: (BuildContext context) {
          return _menuItems
              .map((e) => PopupMenuItem(
                    child: Text(e),
                    value: e,
                  ))
              .toList();
        },
      ),
    );
  }
}
