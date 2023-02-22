import 'package:dinamik_not_app/constants/app_constants.dart';
import 'package:dinamik_not_app/helper/data_helper.dart';
import 'package:flutter/material.dart';

class LessonList extends StatelessWidget {
  final Function onDismiss;
  const LessonList({required this.onDismiss, super.key});

  @override
  Widget build(BuildContext context) {
    return DataHelper.allLessons.length > 0
        ? ListView.builder(
            itemCount: DataHelper.allLessons.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.startToEnd,
                onDismissed: (direction) {
                  onDismiss(index);
                },
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Card(
                    elevation: 10,
                    child: ListTile(
                      title: Text(DataHelper.allLessons[index].name),
                      leading: CircleAvatar(
                        backgroundColor: Constants.mainColor,
                        child: Text((DataHelper.allLessons[index].krediValue *
                                DataHelper.allLessons[index].letterValue)
                            .toStringAsFixed(0)),
                      ),
                      subtitle: Text(
                          '${DataHelper.allLessons[index].krediValue} Kredi, Not Değeri ${DataHelper.allLessons[index].letterValue}'),
                    ),
                  ),
                ),
              );
            },
          )
        : Container(
            child: Center(
                child: Text(
              "Lütfen ders ekleyin",
              style: Constants.titleStyle,
            )),
          );
  }
}
