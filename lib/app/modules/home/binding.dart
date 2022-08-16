import 'package:get/get.dart';
import 'package:todo_application/app/data/providers/task/provider.dart';
import 'package:todo_application/app/data/services/storage/repository.dart';
import 'package:todo_application/app/modules/home/controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(
        taskRepository: TaskRepository(taskProvider: TaskProvider())));
  }
}
