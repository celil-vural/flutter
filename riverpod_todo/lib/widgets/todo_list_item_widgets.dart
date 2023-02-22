import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_todo/providers/all_proverders.dart';

import '../model/todo_model.dart';

class TodoListItemWidgets extends ConsumerStatefulWidget {
  final TodoModel todo;
  const TodoListItemWidgets({super.key, required this.todo});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TodoListItemWidgetsState();
}

class _TodoListItemWidgetsState extends ConsumerState<TodoListItemWidgets> {
  late FocusNode _focusNode;
  late TextEditingController _textEditingController;
  bool _hasFocus = false;
  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (hasFocus) {
        if (!hasFocus) {
          setState(() {
            _hasFocus = false;
          });
          ref.read(todoListProvider.notifier).edit(
              todo: widget.todo, description: _textEditingController.text);
        }
      },
      child: ListTile(
        onTap: () {
          setState(() {
            _hasFocus = true;
            _focusNode.requestFocus();
            _textEditingController.text = widget.todo.description;
          });
        },
        leading: Checkbox(
          value: widget.todo.isDone,
          onChanged: (value) {
            ref.read(todoListProvider.notifier).toggle(widget.todo);
          },
        ),
        title: _hasFocus
            ? TextField(
                controller: _textEditingController,
                focusNode: _focusNode,
              )
            : Text(widget.todo.description),
      ),
    );
  }
}
