import 'package:get_it/get_it.dart';
import 'package:not_sepeti/data/hive_local_storage.dart';
import 'package:not_sepeti/data/local_storage.dart';

final GetIt locator = GetIt.instance;
void setupLocator() {
  locator.registerLazySingleton<LocalStorage>(() => HiveLocalStorage());
}