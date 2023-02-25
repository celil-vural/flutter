import 'package:hive_flutter/adapters.dart';
import 'package:not_sepeti/models/kategori_model.dart';
import 'package:not_sepeti/models/note_model.dart';

Future<void> setupHive() async{
  await Hive.initFlutter();
  Hive.registerAdapter(KategoriAdapter());
  Hive.registerAdapter(NoteAdapter());
  await Hive.openBox<Note>('note');
  await Hive.openBox<Kategori>('kategori');
}