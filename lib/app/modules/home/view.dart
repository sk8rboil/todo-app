// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:todo_application/app/data/models/task.dart';
import 'package:todo_application/app/modules/home/controller.dart';
import 'package:todo_application/app/modules/home/widgets/add_card.dart';
import 'package:todo_application/app/modules/home/widgets/task_card.dart';

class MyHomePage extends GetView<HomeController> {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          // ignore: prefer_const_literals_to_create_immutables
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'MY LIST',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Obx(() => GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  children: <Widget>[
                    ...controller.tasks
                        .map((element) => LongPressDraggable(
                            data: element,
                            onDragStarted: () =>
                                controller.changeDeleting(true),
                            onDraggableCanceled: (_, __) =>
                                controller.changeDeleting(false),
                            onDragEnd: (_) => controller.changeDeleting(false),
                            feedback: Opacity(
                              opacity: 0.8,
                              child: TaskCard(task: element),
                            ),
                            child: TaskCard(task: element)))
                        .toList(),
                    AddCard(),
                  ],
                )),
          ],
        ),
      ),
      floatingActionButton: DragTarget(
        builder: (_, __, ___) {
          return Obx(() => FloatingActionButton(
                backgroundColor:
                    controller.deleting.value ? Colors.red : Colors.indigo,
                onPressed: () {},
                child:
                    Icon(controller.deleting.value ? Icons.delete : Icons.add),
              ));
        },
        onAccept: (Task task) {
          controller.deleteTask(task);
          EasyLoading.showSuccess('Delete Success');
        },
      ),
    );
  }
}
