import 'package:flutter/material.dart';

import '../constants/app_constants.dart';
import '../helper/data_helper.dart';

class KrediDropdownWidget extends StatefulWidget {
  final Function onSelectedKredi;
  const KrediDropdownWidget({required this.onSelectedKredi, super.key});

  @override
  State<KrediDropdownWidget> createState() => _KrediDropdownWidgetState();
}

class _KrediDropdownWidgetState extends State<KrediDropdownWidget> {
  double selectedKrediValue = 1;
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
          value: selectedKrediValue,
          elevation: 16,
          iconEnabledColor: Constants.mainColor.shade200,
          onChanged: (value) {
            setState(() {
              selectedKrediValue = value!;
              widget.onSelectedKredi(value);
            });
          },
          underline: Container(),
          items: DataHelper.allLessionKredi()),
    );
  }
}
