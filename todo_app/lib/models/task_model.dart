import 'package:uuid/uuid.dart';

class Task {
  final String id;
  String title;
  final DateTime createdAt;
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
