import 'package:flutter/material.dart';

class BusinessPage extends StatefulWidget {
  const BusinessPage({super.key});

  @override
  State<BusinessPage> createState() => _BusinessPageState();
}

class _BusinessPageState extends State<BusinessPage> {
  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemExtent: 150, //height
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.all(10),
          child: Material(
            elevation: 4,
            borderRadius: BorderRadius.circular(10),
            color: Colors.black54,
            child: Center(
                child: Text(
              index.toString(),
              style: const TextStyle(color: Colors.white70),
            )),
          ),
        );
      },
    );
  }
}
