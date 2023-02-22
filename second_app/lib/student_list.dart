import 'package:flutter/material.dart';

class StudentList extends StatelessWidget {
  const StudentList({super.key});

  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context)!.settings.arguments as Map;
    print(data);
    List<Student> _allStudent = List.generate(
      10,
      (index) => Student(data["id"] + index, data["name"]),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Student List",
          textAlign: TextAlign.center,
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              var selected = _allStudent[index];
              Navigator.pushNamed(context, "/studentDetails",
                  arguments: selected);
            },
            leading: CircleAvatar(
              child: Text(_allStudent[index].id.toString()),
            ),
            title: Text(_allStudent[index].name.toString()),
            subtitle: Text(_allStudent[index].name.toString()),
          );
        },
        itemCount: 10,
      ),
    );
  }
}

class Student {
  final int? id;
  final String? name;
  Student(this.id, this.name);
}
