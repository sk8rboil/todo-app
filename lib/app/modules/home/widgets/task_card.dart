// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_application/app/core/utils/extension.dart';
import 'package:todo_application/app/data/models/task.dart';
import 'package:todo_application/app/modules/home/controller.dart';

class TaskCard extends StatelessWidget {
  TaskCard({Key? key, required this.task}) : super(key: key);

  final homeCtrl = Get.find<HomeController>();
  final Task task;
  @override
  Widget build(BuildContext context) {
    var color = HexColor.fromHex(task.color);
    final squareWidth = Get.width - 12.0;
    return Container(
      width: squareWidth / 2,
      height: squareWidth / 2,
      margin: EdgeInsets.all(3.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey[300]!,
            blurRadius: 7,
            offset: Offset(0, 7),
          )
        ],
      ),
      child: Column(),
    );
  }
}
