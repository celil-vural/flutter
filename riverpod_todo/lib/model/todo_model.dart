class TodoModel {
  final String id;
  final String description;
  final bool isDone;
  TodoModel({
    required this.id,
    required this.description,
    this.isDone = false,
  });
  TodoModel copyWith({
    String? id,
    String? description,
    bool? isDone,
  }) {
    return TodoModel(
      id: id ?? this.id,
      description: description ?? this.description,
      isDone: isDone ?? this.isDone,
    );
  }
}
