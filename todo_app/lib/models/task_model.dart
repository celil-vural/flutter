import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';
part 'task_model.g.dart';
@HiveType(typeId: 1)
class Task extends HiveObject{
  @HiveField(0)
  final String id;
  @HiveField(1)
  String title;
  @HiveField(2)
  final DateTime createdAt;
  @HiveField(3)
  bool isComplate;

  Task({
    required this.id,
    required this.title,
    required this.createdAt,
    required this.isComplate,
  });
  factory Task.create({
    required String title,
    required DateTime createdAt,
  }) {
    return Task(
      id: const Uuid().v1(),
      title: title,
      createdAt: createdAt,
      isComplate: false,
    );
  }
}
