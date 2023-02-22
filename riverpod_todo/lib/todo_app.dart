import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_todo/providers/all_proverders.dart';
import 'package:riverpod_todo/widgets/title_widgets.dart';
import 'package:riverpod_todo/widgets/todobar_widgets.dart';
import 'widgets/todo_list_item_widgets.dart';

class TodoApp extends ConsumerWidget {
  TodoApp({super.key});

  final newTodoController = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var allTodos=ref.watch(todoListProvider);
    return Scaffold(
      body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          children: [
            const TitleWidgets(),
            TextField(
              controller: newTodoController,
              decoration: const InputDecoration(
                label: Text('Bugün neler yapacaksın?'),
              ),
              onSubmitted: (value) {
                ref.read(todoListProvider.notifier).add(value);
                newTodoController.clear();
              },
            ),
            const SizedBox(
              height: 20,
            ),
            const ToolBarWidgets(),
            for (var i = 0; i < allTodos.length; i++)
              Dismissible(
                  onDismissed: (direction) {
                    ref.read(todoListProvider.notifier).remove(allTodos[i]);
                  },
                  key: Key(allTodos[i].id),
                  child: TodoListItemWidgets(
                    todo: allTodos[i],
                  )),
          ]),
    );
  }
}
