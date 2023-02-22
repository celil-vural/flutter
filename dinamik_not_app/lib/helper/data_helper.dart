import 'package:dinamik_not_app/models/lesson.dart';
import 'package:flutter/material.dart';

class DataHelper {
  static List<Lesson> allLessons = [];
  static addLesson(Lesson lesson) {
    allLessons.insert(0, lesson);
  }

  static double calculateAverage() {
    double totalGrade = 0;
    double totalKredi = 0;
    if (allLessons != null) {
      allLessons.forEach((element) {
        totalGrade = totalGrade + (element.krediValue * element.letterValue);
        totalKredi = totalKredi + element.krediValue;
      });
    }
    return totalGrade / totalKredi;
  }

  static List<String> _allLessonLetter() {
    return [
      'A1',
      'A2',
      'A3',
      'B1',
      'B2',
      'B3',
      'C1',
      'C2',
      'D1',
      'D2',
      'F1',
      'F2'
    ];
  }

  static List<DropdownMenuItem<double>> allLessionKredi() {
    return List.generate(10, (index) => (index + 1))
        .toList()
        .map((e) => DropdownMenuItem(
              child: Text(e.toString()),
              value: e.toDouble(),
            ))
        .toList();
  }

  static double _letterToDouble(String letter) {
    switch (letter) {
      case 'A1':
        return 4.0;
      case 'A2':
        return 3.75;
      case 'A3':
        return 3.50;
      case 'B1':
        return 3.25;
      case 'B2':
        return 3.0;
      case 'B3':
        return 2.75;
      case 'C1':
        return 2.5;
      case 'C2':
        return 2.25;
      case 'D1':
        return 2.0;
      case 'D2':
        return 1.75;
      default:
        return 0.00;
    }
  }

  static List<DropdownMenuItem<double>> allLessionLetter() {
    return _allLessonLetter().map((e) {
      return DropdownMenuItem(
        child: Text(e),
        value: _letterToDouble(e),
      );
    }).toList();
  }
}
