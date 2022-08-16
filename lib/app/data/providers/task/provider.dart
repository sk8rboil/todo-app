import 'dart:convert';

import 'package:get/get.dart';
import 'package:todo_application/app/core/utils/keys.dart';
import 'package:todo_application/app/data/models/task.dart';
import 'package:todo_application/app/data/services/storage/services.dart';

class TaskProvider {
  final _storage = Get.find<StorageService>();

  /*  {'tasks': [
    {
      'title': 'Work',
      'color': '#ff123456',
      'icon': 0xe123,
    }
  ]} */

  List<Task> readTask() {
    var task = <Task>[];
    jsonDecode(_storage.read(String, taskKey).toString())
        .forEach((e) => task.add(Task.fromJson(e)));
    return task;
  }

  void writeTask(List<Task> tasks) {
    _storage.write(taskKey, jsonEncode(tasks));
  }
}
