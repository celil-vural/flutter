import 'package:first_app/ScroolsApp/custom_scrool_view.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'card_and_list.dart';
import 'list_view_used.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'grid_view.dart';

class ScroolsApp extends StatelessWidget {
  const ScroolsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CardAndListApp(),
      builder: EasyLoading.init(),
    );
  }
}
