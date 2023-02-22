
import 'package:hive/hive.dart';
part 'student.g.dart';
@HiveType(typeId: 1)
class Student{
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final EyesColor eyesColor;
  @override
  String toString(){
    return '$id - $name - ${eyesColor.name}';
  }
  Student(this.id, this.name, this.eyesColor);
}
@HiveType(typeId: 2)
enum EyesColor{
  @HiveField(0)
  BLACK,
  @HiveField(1)
  BLUE,
  @HiveField(2)
  GREEN}