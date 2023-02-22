import 'package:burc_rehberi/HoroscopeDetails.dart';
import 'package:burc_rehberi/HoroscopeList.dart';
import 'package:burc_rehberi/model/Horoscope.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static _createRoute(Page, settings) {
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return CupertinoPageRoute(settings: settings, builder: (context) => Page);
    }
    return MaterialPageRoute(settings: settings, builder: (context) => Page);
  }
  static Route<dynamic>? routeGenerator(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _createRoute(HoroscopeList(), settings);
      case '/Details':
        Horoscope selectedHoroscope = settings.arguments as Horoscope;
        return _createRoute(
            HoroscopeDetails(
              selectedHoroscope: selectedHoroscope,
            ),
            settings);
      default:
        return MaterialPageRoute(
            builder: (context) => Scaffold(
                appBar: AppBar(title: Text("404")),
                body: Center(child: Text("Page Not Found"))));
    }
  }
}
