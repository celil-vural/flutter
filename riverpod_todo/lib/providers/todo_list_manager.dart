import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../model/todo_model.dart';

class TodoListManager extends StateNotifier<List<TodoModel>> {
  TodoListManager(List<TodoModel>? initialTodos) : super(initialTodos ?? []);

  void add(String description) {
    state = [
      ...state,
      TodoModel(id: const Uuid().v4(), description: description)
    ];
  }

  void remove(TodoModel todo) {
    state = state.where((element) => element.id != todo.id).toList();
  }

  void toggle(TodoModel todo) {
    state = state
        .map((todo) =>
            todo.id == todo.id ? todo.copyWith(isDone: !todo.isDone) : todo)
        .toList();
  }

  void edit({required TodoModel todo, required String description}) {
    state = state
        .map((todo) =>
            todo.id == todo.id ? todo.copyWith(description: description) : todo)
        .toList();
  }

  int onCompletedTodoCounter() {
    return state.where((element) => element.isDone == false).length;
  }
}
