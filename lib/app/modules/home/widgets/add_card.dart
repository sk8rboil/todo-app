// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_application/app/modules/home/controller.dart';
import 'package:todo_application/app/widgets/icons.dart';

class AddCard extends StatelessWidget {
  final homeCtrl = Get.find<HomeController>();
  AddCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final icon = getIcons();
    var squareWidth = Get.width - 12.0;

    return Container(
      width: squareWidth / 2,
      height: squareWidth / 2,
      margin: EdgeInsets.all(3.0),
      child: InkWell(
        onTap: () async {
          await Get.defaultDialog(
            titlePadding: EdgeInsets.symmetric(vertical: 5.0),
            radius: 10,
            title: 'title type',
            content: Form(
                key: homeCtrl.formkey,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: homeCtrl.editCtrl,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'edit',
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please Enter Your Task Title';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                )),
          );
        },
        child: DottedBorder(
            child: Center(
          child: Icon(
            Icons.add,
            size: 30.0,
            color: Colors.grey,
          ),
        )),
      ),
    );
  }
}
