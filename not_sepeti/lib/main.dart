import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:not_sepeti/core/locator.dart';
import 'package:not_sepeti/core/setup_hive.dart';
import 'package:not_sepeti/data/local_storage.dart';
import 'package:not_sepeti/models/note_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  await setupHive();
  setupLocator();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('tr', 'TR')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en', 'US'),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final LocalStorage db = locator<LocalStorage>();
  @override
  Widget build(BuildContext context) {
    getKategori();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Center(),
    );
  }

  Future<List<Kategori>> getKategori() async {
    List<Kategori> kategori = await db.getAllKategori();
    debugPrint("***************************************");
    debugPrint(kategori.toString());
    return kategori;
  }
}
