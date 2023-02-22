import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:second_app/main.dart';
import 'package:second_app/red_page.dart';
import 'package:second_app/student_details.dart';
import 'package:second_app/student_list.dart';

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
        return _createRoute(MainPage(), settings);
      case '/redPage':
        return _createRoute(Red_Page_App(), settings);
      case '/studentList':
        return _createRoute(StudentList(), settings);
      case '/studentDetails':
        var selectedStudent = settings.arguments as Student;
        return _createRoute(
            StudentDetails(
              selectedStudent: selectedStudent,
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
