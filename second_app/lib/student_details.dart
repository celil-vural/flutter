import 'package:flutter/material.dart';
import 'package:second_app/student_list.dart';

class StudentDetails extends StatelessWidget {
  final Student selectedStudent;
  const StudentDetails({required this.selectedStudent,Key? key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Student Details")),
      body: Center(child: Column(children: [Text(selectedStudent.id.toString()),Text(selectedStudent.name.toString())],)),
    );
  }
}
