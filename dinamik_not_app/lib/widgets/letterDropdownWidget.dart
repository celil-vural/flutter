import 'package:dinamik_not_app/constants/app_constants.dart';
import 'package:dinamik_not_app/helper/data_helper.dart';
import 'package:flutter/material.dart';

class LetterDropdownWidger extends StatefulWidget {
  final Function onSelecetedLetter;
  const LetterDropdownWidger({required this.onSelecetedLetter, super.key});

  @override
  State<LetterDropdownWidger> createState() => _LetterDropdownWidgerState();
}

class _LetterDropdownWidgerState extends State<LetterDropdownWidger> {
  double selectedLetterValue = 4;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: Constants.dropDownPadding,
      decoration: BoxDecoration(
        color: Constants.mainColor.shade100.withOpacity(0.3),
        borderRadius: Constants.borderRadius,
      ),
      child: DropdownButton<double>(
        value: selectedLetterValue,
        elevation: 16,
        iconEnabledColor: Constants.mainColor.shade200,
        onChanged: (value) {
          setState(() {
            selectedLetterValue = value!;
            widget.onSelecetedLetter(value);
          });
        },
        items: DataHelper.allLessionLetter(),
        underline: Container(),
      ),
    );
    ;
  }
}
