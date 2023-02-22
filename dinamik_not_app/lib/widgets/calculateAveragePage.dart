import 'package:dinamik_not_app/constants/app_constants.dart';
import 'package:dinamik_not_app/helper/data_helper.dart';
import 'package:dinamik_not_app/models/lesson.dart';
import 'package:dinamik_not_app/widgets/averageShow.dart';
import 'package:dinamik_not_app/widgets/krediDropdownWidget.dart';
import 'package:dinamik_not_app/widgets/lessonList.dart';
import 'package:dinamik_not_app/widgets/letterDropdownWidget.dart';
import 'package:flutter/material.dart';

class CalculateAverage extends StatefulWidget {
  const CalculateAverage({super.key});
  @override
  State<CalculateAverage> createState() => _CalculateAverageState();
}

class _CalculateAverageState extends State<CalculateAverage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  double selectedKrediValue = 1;
  String selectedLessonValue = '';
  double selectedLetterValue = 4;
  double krediValue = 1;
  double notDegeri = 4;
  double averange = 0.0;
  int selectedLessons = 0;
  List<Lesson> allLesson = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Center(
          child: Text(
            Constants.titleText,
            style: Constants.titleStyle,
          ),
        ),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Row(
          children: [
            Expanded(
              child: _buildForm(),
              flex: 2,
            ),
            Expanded(
              child: AverageShow(
                dersSayisi: selectedLessons,
                average: averange,
              ),
              flex: 1,
            )
          ],
        ),
        Expanded(
          child: LessonList(
            onDismiss: (index) {
              DataHelper.allLessons.removeAt(index);
              setState(() {});
            },
          ),
        )
      ]),
    );
  }

  Form _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: Constants.horizontal8,
            child: _buildFormTextField(),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                    padding: Constants.horizontal8,
                    child: LetterDropdownWidger(
                      onSelecetedLetter: (value) {
                        selectedLetterValue = value;
                      },
                    )),
              ),
              Expanded(
                child: Padding(
                    padding: Constants.horizontal8,
                    child: KrediDropdownWidget(
                      onSelectedKredi: (value) {
                        selectedKrediValue = value;
                      },
                    )),
              ),
              IconButton(
                onPressed: () {
                  _calculate();
                },
                icon: Icon(Icons.arrow_forward_ios_sharp),
                color: Constants.mainColor,
                iconSize: 30,
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }

  _buildFormTextField() {
    return TextFormField(
      onSaved: (newValue) {
        selectedLessonValue = newValue!;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return 'Ders Adı Giriniz';
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
          hintText: 'Matematik',
          border: OutlineInputBorder(
              borderRadius: Constants.borderRadius,
              borderSide: BorderSide.none),
          filled: true,
          fillColor: Constants.mainColor.shade100.withOpacity(0.3)),
    );
  }

  _calculate() {
    debugPrint("object");
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        var addLesson = Lesson(
            name: selectedLessonValue,
            letterValue: selectedLetterValue,
            krediValue: selectedKrediValue);
        DataHelper.addLesson(addLesson);
        setState(() {
          selectedLessons = DataHelper.allLessons.length;
          averange = DataHelper.calculateAverage();
          print("Average: " + averange.toString());
        });
      }
    }
  }
}
