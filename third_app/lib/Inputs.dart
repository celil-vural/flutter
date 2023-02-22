import 'package:flutter/material.dart';

class Inputs extends StatefulWidget {
  const Inputs({super.key});

  @override
  State<Inputs> createState() => _InputsState();
}

class _InputsState extends State<Inputs> {
  TextEditingController? _emailControler;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailControler = TextEditingController(text: 'celil@gmail.com');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Inputs App")),
      body: Column(children: [
        Padding(
          child: TextField(
            controller: _emailControler,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            autofocus: true,
            maxLength: 15,
            onChanged: ((value) {
              print(value);
            }),
            onSubmitted: (value) {
              print(value);
            },
            decoration: InputDecoration(
              labelText: "Email",
              hintText: "Email giriniz...",
              prefixIcon: Icon(Icons.mail),
              suffixIcon: Icon(Icons.mail_outline_outlined),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(18))),
            ),
          ),
          padding: const EdgeInsets.all(16),
        ),
        Padding(
          child: TextField(
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
                labelText: "Password", hintText: "Password giriniz..."),
          ),
          padding: const EdgeInsets.all(16),
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.edit),
      ),
    );
  }
}
