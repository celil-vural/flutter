// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kategori_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class KategoriAdapter extends TypeAdapter<Kategori> {
  @override
  final int typeId = 1;

  @override
  Kategori read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Kategori(
      kategoriId: fields[0] as String,
      kategoriAdi: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Kategori obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.kategoriId)
      ..writeByte(1)
      ..write(obj.kategoriAdi);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is KategoriAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
