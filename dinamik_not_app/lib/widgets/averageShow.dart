import 'package:dinamik_not_app/constants/app_constants.dart';
import 'package:flutter/material.dart';

class AverageShow extends StatelessWidget {
  final double average;
  final int dersSayisi;
  const AverageShow(
      {required this.average, required this.dersSayisi, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          (dersSayisi > 0) ? '$dersSayisi Ders Girildi' : 'Ders Seçiniz',
          style: Constants.lessonCountStyle,
        ),
        Text((average >= 0) ? '${average.toStringAsFixed(2)}' : '0.0',
            style: Constants.averageStyle),
        Text('Ortalama', style: Constants.lessonCountStyle)
      ],
    );
  }
}
