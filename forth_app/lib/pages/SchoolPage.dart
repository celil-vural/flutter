import 'package:flutter/material.dart';

class SchoolPage extends StatefulWidget {
  const SchoolPage({super.key});

  @override
  State<SchoolPage> createState() => _SchoolPageState();
}

class _SchoolPageState extends State<SchoolPage> {
  PageController controller =
      PageController(initialPage: 0, keepPage: true, viewportFraction: 1);
  bool yatayEksen = true;
  bool pageSnapping = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: PageView(
            scrollDirection:
                yatayEksen == true ? Axis.horizontal : Axis.vertical,
            reverse: false,
            controller: controller,
            pageSnapping: pageSnapping,
            onPageChanged: (value) {},
            children: [
              Container(
                width: double.infinity,
                height: 200,
                color: Colors.black45,
                child: Center(
                  child: Text("Sayfa 0"),
                ),
              ),
              Container(
                width: double.infinity,
                height: 200,
                color: Colors.amberAccent.shade400,
                child: Center(
                  child: Text("Sayfa 1"),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 5,
          child: Container(
              width: double.infinity,
              height: 200,
              color: Colors.blue.shade300,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text("Yatay Eksende Çalış"),
                        Checkbox(
                            value: yatayEksen,
                            onChanged: (value) {
                              setState(() {
                                yatayEksen = value as bool;
                              });
                            }),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text("Page Snapping"),
                        Checkbox(
                            value: pageSnapping,
                            onChanged: (value) {
                              setState(() {
                                pageSnapping = value as bool;
                              });
                            }),
                      ],
                    ),
                  )
                ],
              )),
        ),
      ],
    );
  }
}
