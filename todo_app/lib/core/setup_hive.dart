import 'package:hive_flutter/adapters.dart';
import 'package:todo_app/models/task_model.dart';

Future<void> setupHive() async{
  await Hive.initFlutter();
  Hive.registerAdapter(TaskAdapter());
  var taskBox=await Hive.openBox<Task>('tasks');
  for (var element in taskBox.values) { 
    if(element.createdAt.day!=DateTime.now().day){
      element.delete();
    }
  }
}