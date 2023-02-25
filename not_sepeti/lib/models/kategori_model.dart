import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';
part 'kategori_model.g.dart';
@HiveType(typeId: 1)
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
}