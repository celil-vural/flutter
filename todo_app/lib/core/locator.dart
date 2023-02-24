import 'package:get_it/get_it.dart';
import 'package:todo_app/data/hive_local_storage.dart';
import 'package:todo_app/data/local_storage.dart';

final GetIt locator = GetIt.instance;
void setupLocator() {
  locator.registerLazySingleton<LocalStorage>(() => HiveLocalStorage());
}