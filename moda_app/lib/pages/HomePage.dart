// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:moda_app/data/Constant.dart';
import 'package:moda_app/widgets/StoryWidgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Constant.backgroundColor,
        title: Text(
          "Moda App",
          style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 22,
              color: Constant.secondaryColor,
              fontWeight: FontWeight.bold),
        ),
        elevation: 8,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.camera_alt,
                color: Constant.secondaryColor,
              ))
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                StoryWidgets(
                    imagePath: 'assets/model1.jpeg',
                    logoPath: 'assets/chanellogo.jpg'),
                SizedBox(
                  width: 10,
                ),
                StoryWidgets(
                    imagePath: 'assets/model2.jpeg',
                    logoPath: 'assets/chanellogo.jpg'),
                SizedBox(
                  width: 10,
                ),
                StoryWidgets(
                    imagePath: 'assets/model3.jpeg',
                    logoPath: 'assets/chanellogo.jpg'),
                SizedBox(
                  width: 10,
                ),
                StoryWidgets(
                    imagePath: 'assets/model1.jpeg',
                    logoPath: 'assets/chanellogo.jpg'),
                SizedBox(
                  width: 10,
                ),
                StoryWidgets(
                    imagePath: 'assets/model2.jpeg',
                    logoPath: 'assets/chanellogo.jpg'),
                SizedBox(
                  width: 10,
                ),
                StoryWidgets(
                    imagePath: 'assets/model3.jpeg',
                    logoPath: 'assets/chanellogo.jpg'),
                SizedBox(
                  width: 10,
                ),
                StoryWidgets(
                    imagePath: 'assets/model1.jpeg',
                    logoPath: 'assets/chanellogo.jpg'),
                SizedBox(
                  width: 10,
                ),
                StoryWidgets(
                    imagePath: 'assets/model2.jpeg',
                    logoPath: 'assets/chanellogo.jpg'),
                SizedBox(
                  width: 10,
                ),
                StoryWidgets(
                    imagePath: 'assets/model3.jpeg',
                    logoPath: 'assets/chanellogo.jpg'),
                SizedBox(
                  width: 10,
                ),
                StoryWidgets(
                    imagePath: 'assets/model1.jpeg',
                    logoPath: 'assets/chanellogo.jpg'),
                SizedBox(
                  width: 10,
                ),
                StoryWidgets(
                    imagePath: 'assets/model2.jpeg',
                    logoPath: 'assets/chanellogo.jpg'),
                SizedBox(
                  width: 10,
                ),
                StoryWidgets(
                    imagePath: 'assets/model3.jpeg',
                    logoPath: 'assets/chanellogo.jpg'),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Material(
              borderRadius: BorderRadius.circular(20),
              elevation: 5,
              child: Container(
                height: 450,
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Center(
                            child: Container(
                              alignment: Alignment.center,
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  image: const DecorationImage(
                                      image: AssetImage("assets/model1.jpeg"),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              SizedBox(
                                width: 10,
                                height: 10,
                              ),
                              Text(
                                "Daisy",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "34 mins ago",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.more_vert),
                            color: Colors.grey.shade400,
                            iconSize: 20,
                          ),
                        )
                      ],
                    ),
                    Text(
                      "Metin içeriği",
                      style: TextStyle(color: Constant.secondaryColor2),
                    ),
                    Column(
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Container(
                              height: 300,
                              width: MediaQuery.of(context).size.width / 2,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  image: const DecorationImage(
                                      image:
                                          AssetImage("assets/modelgrid1.jpeg"),
                                      fit: BoxFit.cover)),
                            ),
                            Column(
                              children: [
                                Container(
                                  height: 150,
                                  width: MediaQuery.of(context).size.width / 3,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      image: const DecorationImage(
                                          image: AssetImage(
                                              "assets/modelgrid2.jpeg"),
                                          fit: BoxFit.cover)),
                                ),
                                Container(
                                  height: 150,
                                  width: MediaQuery.of(context).size.width / 3,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      image: const DecorationImage(
                                          image: AssetImage(
                                              "assets/modelgrid3.jpeg"),
                                          fit: BoxFit.cover)),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
