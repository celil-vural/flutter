import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:todo_app/core/locator.dart';
import 'package:todo_app/data/local_storage.dart';
import 'package:todo_app/helper/translations_helper.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/widgets/custom_search_delegate.dart';
import 'package:todo_app/widgets/dismissible_bg.dart';
import 'package:todo_app/widgets/task_list_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Task> _allTasks;
  late LocalStorage _localStorage;
  @override
  void initState() {
    super.initState();
    _localStorage = locator<LocalStorage>();
    _allTasks = <Task>[];
    _getAllTaskFromDb();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: getAppBar(),
      body: _allTasks.isNotEmpty
          ? ListView.builder(
              itemCount: _allTasks.length,
              itemBuilder: (context, index) {
                var item = _allTasks[index];
                return Dismissible(
                    key: Key(item.id),
                    background: const DismissibleBg(),
                    onDismissed: (direction) async {
                      _allTasks.removeAt(index);
                      await _localStorage.deleteTask(task: item);
                      setState(() {});
                    },
                    child: TaskItem(task: item));
              },
            )
          : Center(
              child:const Text('empty_task_list').tr(),
            ),
    );
  }

  AppBar getAppBar() {
    return AppBar(
      title: GestureDetector(
        onTap:_showAddTaskBottomSheet,
        child: const Text(
          'title',
          style: TextStyle(
            color: Colors.black,
          ),
        ).tr(),
      ),
      centerTitle: false,
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed:_showSearchPage,
        ),
        IconButton(
          onPressed:_showAddTaskBottomSheet,
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }

  _showAddTaskBottomSheet() {
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
              decoration: InputDecoration(
                  hintText: 'add_task'.tr(), border: InputBorder.none),
              onSubmitted: (value) {
                Navigator.of(context).pop();
                if (value.length > 3) {
                  DatePicker.showTimePicker(
                    context,
                    showSecondsColumn: false,
                    locale: TranslationsHelper.getDevixeLanguage(context),
                    currentTime: DateTime.now(),
                    onConfirm: (time) async {
                      var newTask = Task.create(title: value, createdAt: time);
                      int index = 0;
                      if (_allTasks.isNotEmpty) {
                        for (var element in _allTasks) {
                          if (element.createdAt.isAfter(time)) {
                            break;
                          }
                          index++;
                        }
                        _allTasks.insert(index, newTask);
                      } else {
                        _allTasks.add(newTask);
                      }
                      await _localStorage.addTask(task: newTask);
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

  void _getAllTaskFromDb() async {
    _allTasks = await _localStorage.getAllTask();
    setState(() {});
  }
  
  _showSearchPage() async{
    await showSearch(context: context, delegate: CustomSearchDelegate(allTasks: _allTasks));
    _getAllTaskFromDb();
  }
}
