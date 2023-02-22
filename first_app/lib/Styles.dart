import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  final String img =
      "https://cdn1.ntv.com.tr/gorsel/49yx_7WhVU2AgWnPgdwYmg.jpg?width=990&height=660&mode=crop&scale=both&v=20200419071959431";
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: getThemeData(),
      home: getHome(),
      debugShowCheckedModeBanner: false,
    );
  }

  Scaffold getHome() {
    return Scaffold(
      appBar: getAppBar(),
      body: getBody(),
      floatingActionButton: getFloatingActionButton(),
    );
  }

  ThemeData getThemeData() {
    return ThemeData(
      primaryColor: Colors.teal,
      accentColor: Colors.amber,
    );
  }

  FloatingActionButton getFloatingActionButton() {
    return FloatingActionButton(
      backgroundColor: Colors.cyanAccent.shade700,
      onPressed: () {
        debugPrint("Tıklandı");
      },
      child: Icon(
        Icons.add,
        color: Colors.white70,
      ),
    );
  }

  AppBar getAppBar() {
    return AppBar(
      title: Text('App bar'),
    );
  }

  Widget getBody() {
    return Center(
        child: Container(
      margin: EdgeInsets.all(10),
      alignment: Alignment.center,
      padding: EdgeInsets.all(10),
      child: Container(
        color: Colors.amber,
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: getRowContent,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: getRowContent,
          ),
        ]),
      ),
/*       decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 2, color: Colors.black26),
          image: DecorationImage(
            image: NetworkImage(img),
            fit: BoxFit.cover,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              offset: Offset(0, 20),
              blurRadius: 20,
            )
          ]
        ), */
    ));
  }

  List<Widget> get getRowContent {
    return [
      Flexible(child: Icon(Icons.add_circle, size: 64, color: Colors.yellow)),
      Flexible(child: Icon(Icons.add_circle, size: 64, color: Colors.yellow)),
      Flexible(child: Icon(Icons.add_circle, size: 64, color: Colors.yellow)),
      Flexible(child: Icon(Icons.add_circle, size: 64, color: Colors.yellow)),
      Flexible(child: Icon(Icons.add_circle, size: 64, color: Colors.yellow)),
    ];
  }
}
