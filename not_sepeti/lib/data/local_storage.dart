import 'package:not_sepeti/models/note_model.dart';

abstract class LocalStorage{
  Future<void> addNote({required Note note});
  Future<Note?> getNote({required String id});
  Future<List<Note>> getAllNote();
  Future<bool> deleteNote({required Note note});
  Future<Note> updateNote({required Note note});
  Future<void> addKadegori({required Kategori kategori});
  Future<Kategori?> getKategori({required String id});
  Future<bool> deleteKategori({required Kategori kategori});
  Future<List<Kategori>> getAllKategori();
  Future<Kategori> updateKategori({required Kategori kategori});
}