import 'package:flutter/material.dart';

class SelectCity extends StatefulWidget {
  const SelectCity({super.key});

  @override
  State<SelectCity> createState() => _SelectCityState();
}

class _SelectCityState extends State<SelectCity> {
  final TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select City'),
      ),
      body: Form(
          child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                controller: _textEditingController,
                decoration: const InputDecoration(
                  labelText: 'City',
                  hintText: 'Enter a city',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          IconButton(onPressed: (){
            Navigator.pop(context, _textEditingController.text);
          }, icon: const Icon(Icons.search) )
        ],
      )),
    );
  }
}
