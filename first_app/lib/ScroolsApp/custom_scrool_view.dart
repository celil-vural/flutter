import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:math' as Math;

class CustomScroolViwApp extends StatelessWidget {
  const CustomScroolViwApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: CustomScrollView(slivers: [
          SliverAppBar(
            expandedHeight: 150,
            flexibleSpace: FlexibleSpaceBar(
                title: Text("Bar Title"),
                background: Image.asset(
                  "assets/images/cars.jpg",
                  fit: BoxFit.cover,
                )),
            title: Text(
              "Sliver App Bar",
              textAlign: TextAlign.center,
            ),
            backgroundColor: Colors.blue.shade500,
            floating: false, //aşağı çektiğinde app bar gözükür
            pinned: true,
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            childCount: 5,
            (context, index) {
              return Container(
                  height: 200,
                  alignment: Alignment.center,
                  color: Colors.cyan,
                  child: Text("merhaba",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 34)));
            },
          )),
          SliverPadding(
            padding: EdgeInsets.all(20),
            sliver: SliverList(
                delegate:
                    SliverChildBuilderDelegate(childCount: 5, (context, index) {
              return Container(
                child: Text("Dinamik liste elemanı ${index}",
                    style: TextStyle(fontSize: 34),
                    textAlign: TextAlign.center),
                alignment: Alignment.center,
                color: Color.fromARGB(
                    Math.Random().nextInt(255),
                    Math.Random().nextInt(255),
                    Math.Random().nextInt(255),
                    Math.Random().nextInt(255)),
              );
            })),
          )
        ]),
      ),
    );
  }
}
