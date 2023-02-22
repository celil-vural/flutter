// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:moda_app/data/Constant.dart';

class StoryWidgets extends StatelessWidget {
  final String imagePath;
  final String logoPath;
  const StoryWidgets(
      {required this.imagePath, required this.logoPath, super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin:const EdgeInsets.only(left: 10, top: 8),
          decoration: BoxDecoration(
            border: Border.all(
                width: 4,
                color: Constant.secondaryColor2,
                style: BorderStyle.solid,
                strokeAlign: StrokeAlign.center),
            borderRadius: const BorderRadius.all(Radius.circular(50)),
          ),
          child: Stack(
            children: [
              Container(
                height: 65,
                width: 65,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    image: DecorationImage(
                        image: AssetImage(imagePath), fit: BoxFit.cover)),
              ),
              Positioned(
                top: 45,
                left: 45,
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage(logoPath), fit: BoxFit.cover)),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
