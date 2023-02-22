import 'package:flutter/material.dart';

class Red_Page_App extends StatelessWidget {
  const Red_Page_App({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        debugPrint("Will Pop Scope Çalıştı");
        //geri gelmeden önce çalışıcak fonksiyon geri tuşu ile
        //aşağıdaki butonla geri gidilirse burası çalışmaz
        Navigator.of(context).pop();
        //Navigator.of(context).maybePop(); //geride bir stack varsa geri gider yoksa gitmez
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Red_Page_App"),
          backgroundColor: Colors.red.shade200,
          automaticallyImplyLeading: false, //app bardaki geri tuşunu kaldırır
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Red Page",
                style: TextStyle(fontSize: 36),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    //Navigator.of(context).maybePop(); //geride bir stack varsa geri gider yoksa gitmez
                  },
                  child: Text("Geri Dön"))
            ],
          ),
        ),
      ),
    );
  }
}
