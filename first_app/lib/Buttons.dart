import 'package:flutter/material.dart';

class ButtonsApp extends StatelessWidget {
  const ButtonsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Images App",
        home: Scaffold(
            appBar: AppBar(
              title: Text("Images App"),
              centerTitle: true,
            ),
            body: Column(
              children: [
                TextButton(onPressed: () {}, child: Text("TextButton")),
                TextButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.ac_unit),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.black12),
                        overlayColor: MaterialStateProperty.all(
                            Colors.blue.shade400.withOpacity(0.5))),
                    label: Text("Text button with icon")),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Elevate"),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.amber, onPrimary: Colors.black),
                ),
                ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.ac_unit_sharp),
                    label: Text("Elevated Button with icon")),
                OutlinedButton(
                    onPressed: () {}, child: Text("Outlined button")),
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.access_alarms_outlined),
                  label: Text("Outline with icon"),
                  style: OutlinedButton.styleFrom(
                      shape: StadiumBorder(),
                      side: BorderSide(color: Colors.black87, width: 2)),
                )
              ],
            )));
  }
}
