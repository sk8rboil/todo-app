import 'package:todo_application/app/data/models/task.dart';

class TaskRepository {
  TaskRepository taskProvider;
  TaskRepository({required this.taskProvider});

  List<Task> readTask() => taskProvider.readTask();
  void writeTasks(List<Task> task) => taskProvider.writeTasks(task);
}
