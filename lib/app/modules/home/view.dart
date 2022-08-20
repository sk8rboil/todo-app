// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
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
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              children: <Widget>[
                TaskCard(
                    task:
                        Task(title: 'title', icon: 0xe59c, color: '#FF2B60E6')),
                AddCard(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
