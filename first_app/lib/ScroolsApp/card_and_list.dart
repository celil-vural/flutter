import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CardAndListApp extends StatelessWidget {
  const CardAndListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: singleChildeMethod(),//yada listview kullan oda birden fazla eleman bekler reverse methodu var
      ),
      appBar: AppBar(
        title: Text("Card And List App"),
      ),
    );
  }

  SingleChildScrollView singleChildeMethod() {
    return SingleChildScrollView(
        child: Column(
          children: [
            OneListElemans(),
            OneListElemans(),
            OneListElemans(),
            OneListElemans(),
            OneListElemans(),
            OneListElemans(),
            OneListElemans(),
            OneListElemans(),
            OneListElemans(),
            OneListElemans(),
            OneListElemans(),
            OneListElemans(),
            OneListElemans(),
            OneListElemans(),
            OneListElemans(),
            OneListElemans(),
          ],
        ),
      );
  }

  Column OneListElemans() {
    return Column(children: [
      Card(
        color: Colors.blueAccent.shade100,
        shadowColor: Colors.black54,
        elevation: 12,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          leading: CircleAvatar(child: Icon(Icons.add)),
          title: Text("Başlık"),
          subtitle: Text("Alt başlık"),
          trailing: Icon(Icons.access_time_outlined),
        ),
      ),
      Divider(
        color: Colors.redAccent.shade200,
        thickness: 1,
        height: 5,
        indent: 20,
        endIndent: 20,
      )
    ]);
  }
}
