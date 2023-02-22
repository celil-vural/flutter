import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_todo/providers/todo_list_manager.dart';

import '../model/todo_model.dart';

final todoListProvider = StateNotifierProvider<TodoListManager,List<TodoModel>>((ref){
  return TodoListManager([]);
});