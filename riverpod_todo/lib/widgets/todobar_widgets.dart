import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_todo/providers/all_proverders.dart';

class ToolBarWidgets extends ConsumerWidget {
  const ToolBarWidgets({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int inComplateTodoCount = ref
        .watch(todoListProvider)
        .where((element) => element.isDone == false)
        .length;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
              inComplateTodoCount == 0
                  ? 'All todos are complated'
                  : '${inComplateTodoCount.toString()} todos are incomplate',
              overflow: TextOverflow.ellipsis),
        ),
        Tooltip(
          message: 'All Todos',
          child: TextButton(
            onPressed: () {},
            child: const Text('All'),
          ),
        ),
        Tooltip(
          message: 'Active Todos',
          child: TextButton(
            onPressed: () {},
            child: const Text('Active'),
          ),
        ),
        Tooltip(
          message: 'Complated Todos',
          child: TextButton(
            onPressed: () {},
            child: const Text('Complated'),
          ),
        ),
      ],
    );
  }
}
