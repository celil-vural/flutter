// ignore: file_names
import 'package:flutter/material.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({
    Key? key,
  }) : super(key: key);

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        UserAccountsDrawerHeader(
          accountName: const Text("Başlık Name"),
          accountEmail: const Text("Başık email"),
          currentAccountPicture: Image.network(
            "https://www.sony.com.tr/image/bc6d25fa6371c2899ce704a2bed7614c?fmt=png-alpha&wid=960",
            fit: BoxFit.fill,
          ),
          otherAccountsPictures: const [
            CircleAvatar(
              backgroundColor: Colors.brown,
              child: Text("A"),
            ),
            CircleAvatar(
              backgroundColor: Colors.brown,
              child: Text("B"),
            )
          ],
        ),
        Expanded(
          child: ListView(
            children: const [
               Card(
                elevation: 15,
                child: ListTile(
                  leading: Icon(Icons.home),
                  title: Text('Anasayfa'),
                ),
              )
            ],
          ),
        )
      ],
    ));
  }
}
