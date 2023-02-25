import 'package:hive/hive.dart';
import 'package:not_sepeti/data/local_storage.dart';
import 'package:not_sepeti/models/kategori_model.dart';
import 'package:not_sepeti/models/note_model.dart';

class HiveLocalStorage extends LocalStorage {
  late Box<Note> _noteBox;
  late Box<Kategori> _kategoriBox;
  HiveLocalStorage() {
    _noteBox = Hive.box<Note>('note');
    _kategoriBox = Hive.box<Kategori>('kategori');
  }
  @override
  Future<void> addNote({required Note note}) async {
    await _noteBox.put(note.noteId, note);
  }

  @override
  Future<bool> deleteNote({required Note note}) async {
    try {
      await note.delete();
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<List<Note>> getAllNote() async {
    List<Note> allNotes = <Note>[];
    allNotes = _noteBox.values.toList();
    if (allNotes.isNotEmpty) {
      allNotes.sort((Note a, Note b) => a.noteDate.compareTo(b.noteDate));
    }
    return allNotes;
  }

  @override
  Future<Note?> getNote({required String id}) async {
    if (_noteBox.containsKey(id)) {
      return _noteBox.get(id);
    } else {
      return null;
    }
  }
  @override
  Future<Note> updateNote({required Note note}) async {
    await note.save();
    return note;
  }

  @override
  Future<void> addKadegori({required Kategori kategori}) async {
    await _kategoriBox.put(kategori.kategoriId, kategori);
  }

  @override
  Future<bool> deleteKategori({required Kategori kategori}) async {
    try {
      await kategori.delete();
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<List<Kategori>> getAllKategori() async {
    List<Kategori> allKategories = <Kategori>[];
    allKategories = _kategoriBox.values.toList();
    return allKategories;
  }

  @override
  Future<Kategori?> getKategori({required String id}) async{
    if (_kategoriBox.containsKey(id)) {
      return _kategoriBox.get(id);
    } else {
      return null;
    }
  }
  
  @override
  Future<Kategori> updateKategori({required Kategori kategori}) async{
    await kategori.save();
    return kategori;
  }
}
