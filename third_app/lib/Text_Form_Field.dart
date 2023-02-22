import 'package:flutter/material.dart';

class TextFormField extends StatefulWidget {
  const TextFormField({super.key});

  @override
  State<TextFormField> createState() => _TextFormFieldState();
}

class _TextFormFieldState extends State<TextFormField> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Text Form Field")),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
            child: Column(
          children: [TextFormField()],
        )),
      )),
    );
  }
}
