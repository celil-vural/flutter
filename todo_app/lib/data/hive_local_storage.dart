import 'package:hive/hive.dart';
import 'package:todo_app/data/local_storage.dart';
import 'package:todo_app/models/task_model.dart';

class HiveLocalStorage extends LocalStorage {
  late Box<Task> _taskBox;
  HiveLocalStorage() {
    _taskBox = Hive.box<Task>('tasks');
  }
  @override
  Future<void> addTask({required Task task}) async {
    await _taskBox.put(task.id, task);
  }

  @override
  Future<bool> deleteTask({required Task task}) async {
    try {
      await task.delete();
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<List<Task>> getAllTask() async {
    List<Task> allTasks = <Task>[];
    allTasks = _taskBox.values.toList();
    if (allTasks.isNotEmpty) {
      allTasks.sort((Task a, Task b) => a.createdAt.compareTo(b.createdAt));
    }
    return allTasks;
  }

  @override
  Future<Task?> getTask({required String id}) async {
    if (_taskBox.containsKey(id)) {
      return _taskBox.get(id);
    } else {
      return null;
    }
  }

  @override
  Future<Task> updateTask({required Task task}) async {
    await task.save();
    return task;
  }
}
