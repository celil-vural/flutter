// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StudentAdapter extends TypeAdapter<Student> {
  @override
  final int typeId = 1;

  @override
  Student read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Student(
      fields[0] as int,
      fields[1] as String,
      fields[2] as EyesColor,
    );
  }

  @override
  void write(BinaryWriter writer, Student obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.eyesColor);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StudentAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class EyesColorAdapter extends TypeAdapter<EyesColor> {
  @override
  final int typeId = 2;

  @override
  EyesColor read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return EyesColor.BLACK;
      case 1:
        return EyesColor.BLUE;
      case 2:
        return EyesColor.GREEN;
      default:
        return EyesColor.BLACK;
    }
  }

  @override
  void write(BinaryWriter writer, EyesColor obj) {
    switch (obj) {
      case EyesColor.BLACK:
        writer.writeByte(0);
        break;
      case EyesColor.BLUE:
        writer.writeByte(1);
        break;
      case EyesColor.GREEN:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EyesColorAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
