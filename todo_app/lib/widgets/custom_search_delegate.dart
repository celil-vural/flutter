import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/core/locator.dart';
import 'package:todo_app/data/local_storage.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/widgets/dismissible_bg.dart';
import 'package:todo_app/widgets/task_list_item.dart';

class CustomSearchDelegate extends SearchDelegate {
  final List<Task> allTasks;
  CustomSearchDelegate({required this.allTasks});
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query.isEmpty ? null : query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(
        Icons.arrow_back_ios,
        color: Colors.black,
        size: MediaQuery.of(context).size.width * 0.1,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Task> filteredList = allTasks
        .where((element) => element.title.toLowerCase().contains(query))
        .toList();
    return filteredList.isNotEmpty
        ? ListView.builder(
            itemCount: filteredList.length,
            itemBuilder: (context, index) {
              var item = filteredList[index];
              return Dismissible(
                  key: Key(item.id),
                  background: const DismissibleBg(),
                  onDismissed: (direction) async {
                    filteredList.removeAt(index);
                    await locator<LocalStorage>().deleteTask(task: item);
                  },
                  child: TaskItem(task: item));
            },
          )
        : Center(
            child: Text('not_found').tr(),
          );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Task> filteredList = allTasks
        .where((element) => element.title.toLowerCase().contains(query))
        .toList();
    return filteredList.isNotEmpty
        ? ListView.builder(
            itemCount: filteredList.length,
            itemBuilder: (context, index) {
              var item = filteredList[index];
              return Dismissible(
                  key: Key(item.id),
                  background: const DismissibleBg(),
                  onDismissed: (direction) async {
                    filteredList.removeAt(index);
                    await locator<LocalStorage>().deleteTask(task: item);
                  },
                  child: TaskItem(task: item));
            },
          )
        : Center(
            child: Text('not_found').tr(),
          );
  }
}
