import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/core/locator.dart';
import 'package:todo_app/data/local_storage.dart';
import 'package:todo_app/models/task_model.dart';

class TaskItem extends StatefulWidget {
  const TaskItem({super.key, required this.task});
  final Task task;
  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  final TextEditingController _taskNameController = TextEditingController();
  late final LocalStorage _localStorage;
  @override
  void initState() {
    super.initState();
    _localStorage = locator<LocalStorage>();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    _taskNameController.text = widget.task.title;
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: width * 0.05,
        vertical: height * 0.01,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
          ),
        ],
      ),
      child: ListTile(
        leading: GestureDetector(
          onTap: () {
            setState(() {
              widget.task.isComplate = !widget.task.isComplate;
              _localStorage.updateTask(task: widget.task);
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color: widget.task.isComplate ? Colors.green : Colors.white,
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.grey.shade800,
                width: 0.8,
              ),
            ),
            child: const Icon(Icons.check, color: Colors.white),
          ),
        ),
        title: widget.task.isComplate
            ? Text(
                widget.task.title,
                style: const TextStyle(
                  decoration: TextDecoration.lineThrough,
                  color: Colors.grey,
                ),
              )
            : TextField(
                textInputAction: TextInputAction.done,
                minLines: 1,
                maxLines: null,
                controller: _taskNameController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
                onSubmitted: (value) async {
                  if (value.length > 3) {
                    widget.task.title = value;
                    await _localStorage.updateTask(task: widget.task);
                    setState(() {});
                  }
                },
              ),
        trailing: Text(
          DateFormat('hh:mm a').format(widget.task.createdAt),
          style: const TextStyle(color: Colors.grey, fontSize: 16),
        ),
      ),
    );
  }
}
