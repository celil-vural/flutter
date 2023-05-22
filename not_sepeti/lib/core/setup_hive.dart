import 'package:hive_flutter/adapters.dart';
import 'package:not_sepeti/models/note_model.dart';

Future<void> setupHive() async{
  await Hive.initFlutter();
  Hive.registerAdapter(NoteAdapter());
  await Hive.openBox<Note>('note');
  await Hive.openBox<Kategori>('kategori');
}