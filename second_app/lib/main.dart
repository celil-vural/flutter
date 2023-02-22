import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:second_app/red_page.dart';
import 'package:second_app/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My App",
      /*routes: {
        "/redPage": (context) => Red_Page_App(),
        "/": (context) => MainPage(),
      },
      
      onUnknownRoute: (settings) => MaterialPageRoute(builder: (context) => Scaffold(
        appBar: AppBar(title: Text("Error")),
        body: Center(child: Text("404 Not Found"),),
      ),),*/
      onGenerateRoute: RouteGenerator.routeGenerator,
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text("My NAvigation App", textAlign: TextAlign.center)),
      body: Center(
          child: Container(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    CupertinoPageRoute(builder: (context) => Red_Page_App()));
              },
              child: Text("Kırmızı sayfaya git IOS"),
              style: ElevatedButton.styleFrom(primary: Colors.red.shade300),
            ),
            ElevatedButton(
              onPressed: () {
                //Navigator.push(context, MaterialPageRoute(builder: (context) => Red_Page_App()));
                // pushReplacement() ile oluşturursan bir sonraki sayfa stacte bu sayfanın yerini alır
                //bunu bir login ekranından sonra anasayfaya giderken kullanabilirsin bu sayede
                //login formu stackten silinir
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Red_Page_App()));
              },
              child: Text("Sarı sayfaya git ANDROİD"),
              style: ElevatedButton.styleFrom(primary: Colors.red.shade300),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .maybePop(); //geride bir stack varsa geri gider yoksa gitmez
              },
              child: Text("Geri git"),
              style: ElevatedButton.styleFrom(primary: Colors.red.shade300),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/redPage");
              },
              child: Text("rede git"),
              style: ElevatedButton.styleFrom(primary: Colors.blue.shade300),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/studentList",
                    arguments: {"name": "default name", "id": 20});
              },
              child: Text("Liste oluştur"),
              style: ElevatedButton.styleFrom(primary: Colors.orange.shade300),
            ),
          ],
        ),
      )),
    );
  }
}
