import 'package:flutter/material.dart';
import 'package:forth_app/DrawerMenu.dart';
import 'package:forth_app/pages/BusinessPage.dart';
import 'package:forth_app/pages/MainPage.dart';
import 'package:forth_app/pages/SchoolPage.dart';
import 'package:forth_app/pages/SettingsPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static const PageStorageKey keyMainPage = PageStorageKey("key_MainPage");
  static const PageStorageKey keyBusiness = PageStorageKey("key_business");
  int _currentIndex = 0;
  List<Widget> allPages = [];
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    allPages = [
      const MainPage(
        key: keyMainPage,
      ),
      const BusinessPage(key: keyBusiness),
      const SchoolPage(),
      const SettingsPage()
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Ders 4",
      home: Scaffold(
          appBar: AppBar(),
          drawer: const DrawerMenu(),
          body: allPages[_currentIndex],
          bottomNavigationBar: BottomNavigationApp()),
    );
  }

  // ignore: non_constant_identifier_names
  BottomNavigationBar BottomNavigationApp() {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
          backgroundColor: Colors.blue,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          label: 'Business',
          backgroundColor: Colors.blue,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.school),
          label: 'School',
          backgroundColor: Colors.blue,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
          backgroundColor: Colors.blue,
        ),
      ],
      type: BottomNavigationBarType.shifting,
      currentIndex: _currentIndex,
      selectedItemColor: Colors.white,
      onTap: _onItemTapped,
    );
  }

  void _onItemTapped(int value) {
    setState(() {
      _currentIndex = value;
    });
  }
}
