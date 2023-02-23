import 'package:flutter/material.dart';

class DismissibleBg extends StatelessWidget {
  const DismissibleBg({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.25,
            child: Center(
              child: Icon(
                Icons.delete_outline,
                color: Colors.white,
                size: MediaQuery.of(context).size.width * 0.1,
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.25,
            child: Center(
              child: Icon(
                Icons.delete_outline,
                color: Colors.white,
                size: MediaQuery.of(context).size.width * 0.1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
