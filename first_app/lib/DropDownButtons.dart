import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Dropdown",
      home: DropDownApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class DropDownApp extends StatefulWidget {
  const DropDownApp({super.key});

  @override
  State<DropDownApp> createState() => _DropDownAppState();
}

class _DropDownAppState extends State<DropDownApp> {
  String? _selectedItem = null;
  List<String> _allCity = ["Ankara", "İzmir", "Bursa", "Giresun"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("DropDown"),
          centerTitle: true,
        ),
        body: Container(
          child: DropdownButton<String>(
            onChanged: (value) {
              setState(() {
                _selectedItem = value;
              });
            },
            hint: Text("Şehir Seçiniz.."),
            /*items: [
              DropdownMenuItem(child: Text("Ankara"), value: "Ankara"),
              DropdownMenuItem(child: Text("İzmir"), value: "İzmir"),
              DropdownMenuItem(child: Text("Denizli"), value: "Denizli"),
              DropdownMenuItem(child: Text("Giresun"), value: "Giresun")
            ],*/
            items: _allCity
                .map((eleman) =>
                    DropdownMenuItem(child: Text(eleman), value: eleman))
                .toList(),
            value: _selectedItem,
          ),
        ));
  }
}
