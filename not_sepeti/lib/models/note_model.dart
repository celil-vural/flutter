import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';
part 'note_model.g.dart';
@HiveType(typeId: 1)
class Note extends HiveObject {
  @HiveField(0)
  final String noteId;
  @HiveField(1)
  final String kategoriId;
  @HiveField(2)
  final String noteTitle;
  @HiveField(3)
  final String noteContent;
  @HiveField(4)
  final DateTime noteDate;
  @HiveField(5)
  final int noteDegree;

  Note(this.noteId, this.kategoriId, this.noteTitle, this.noteContent,
      this.noteDate, this.noteDegree);
  factory Note.create({
    required String kategoriId,
    required String noteTitle,
    required String noteContent,
    DateTime? noteDate,
    int noteDegree = 0,
  }) 
  {
    noteDate ??= DateTime.now();
    return Note(
      const Uuid().v1(),
      kategoriId,
      noteTitle,
      noteContent,
      noteDate,
      noteDegree,
    );
  }
  @override
  String toString() {
    return '{noteId: $noteId, kategoriId: $kategoriId, noteTitle: $noteTitle, noteContent: $noteContent, noteDate: $noteDate, noteDegree: $noteDegree}';
  }
}
@HiveType(typeId: 2)
class Kategori extends HiveObject{
  @HiveField(0)
  final String kategoriId;
  @HiveField(1)
  final String kategoriAdi;

  Kategori({required this.kategoriId,required this.kategoriAdi});
  factory Kategori.create({required String kategoriAdi}){
    return Kategori(
      kategoriId: const Uuid().v1(),
      kategoriAdi: kategoriAdi,
    );
  }
  @override
  String toString() {
    return '{kategoriId: $kategoriId, kategoriAdi: $kategoriAdi}';
  }
}
