import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class ListViewUsed extends StatelessWidget {
  ListViewUsed({super.key});
  List<Ogrenci> _allStudents =
      List.generate(200, (index) => Ogrenci(index, "Ogrenci${index + 1}"));
  @override
  void _alertAccess(context, selectedStudent) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context2) {
          return AlertDialog(
            title: Text(selectedStudent.toString()),
            content: SingleChildScrollView(
              child: ListBody(
                children: [Text("İçerik 1 " * 10), Text("İçerik 2" * 10)],
              ),
            ),
            actions: [
              ButtonBar(
                children: [
                  
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Cancel")),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Ok"))
                ],
              )
            ],
          );
        });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Öğrenci Listesi"),
        ),
        body: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            var _currentStdent = _allStudents[index];
            return Card(
              color: index % 2 == 0 ? Colors.black26 : Colors.black38,
              child: ListTile(
                onLongPress: () {
                  _alertAccess(context, _currentStdent);
                },
                onTap: () {
                  EasyLoading.showToast("Elemana tıklandı",
                      duration: Duration(seconds: 3),
                      dismissOnTap: true,
                      toastPosition: EasyLoadingToastPosition.bottom);
                },
                title: Text(_currentStdent.name),
                subtitle: Text(_currentStdent.name),
                leading: CircleAvatar(
                  child: Text(_currentStdent.id.toString()),
                ),
              ),
            );
          },
          itemCount: _allStudents.length,
          separatorBuilder: (context, index) {
            return Divider(thickness: 2, color: Colors.black12);
          },
        ));
  }
}

class Ogrenci {
  final int id;
  final String name;
  Ogrenci(this.id, this.name);
  @override
  String toString() {
    // TODO: implement toString
    return 'Isim: ${name} id:${id}';
  }
}
