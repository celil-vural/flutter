import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/widgets/dismissible_bg.dart';
import 'package:todo_app/widgets/task_list_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Task> _allTasks;

  @override
  void initState() {
    super.initState();
    _allTasks = <Task>[];
    _allTasks.add(Task.create(title: 'title', createdAt: DateTime.now()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: getAppBar(context),
      body: _allTasks.isNotEmpty
          ? ListView.builder(
              itemCount: _allTasks.length,
              itemBuilder: (context, index) {
                var _item = _allTasks[index];
                return Dismissible(
                  key: Key(_item.id),
                  background:const DismissibleBg(),
                  onDismissed: (direction) {
                    setState(() {
                      _allTasks.removeAt(index);
                    });
                  },
                  child: TaskItem(task: _item)
                );
              },
            )
          : const Center(
              child: Text('Görev ekle'),
            ),
    );
  }

  AppBar getAppBar(BuildContext context) {
    return AppBar(
      title: GestureDetector(
        onTap: () => _showAddTaskBottomSheet(context),
        child: const Text(
          'Bugün neler yapacaksın?',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      centerTitle: false,
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {},
        ),
        IconButton(
          onPressed: () => _showAddTaskBottomSheet(context),
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }

  void _showAddTaskBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          width: MediaQuery.of(context).size.width,
          child: ListTile(
            title: TextField(
              autofocus: true,
              style: const TextStyle(fontSize: 20),
              decoration: const InputDecoration(
                  hintText: 'Yeni görev ekle', border: InputBorder.none),
              onSubmitted: (value) {
                Navigator.of(context).pop();
                if (value.length > 3) {
                  DatePicker.showTimePicker(
                    context,
                    showSecondsColumn: false,
                    onConfirm: (time) {
                      var newTask = Task.create(title: value, createdAt: time);
                      _allTasks.add(newTask);
                      setState(() {});
                    },
                  );
                }
              },
            ),
          ),
        );
      },
    );
  }
}
