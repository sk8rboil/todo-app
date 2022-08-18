// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, unrelated_type_equality_checks

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:todo_application/app/core/utils/extension.dart';
import 'package:todo_application/app/data/models/task.dart';
import 'package:todo_application/app/modules/home/controller.dart';
import 'package:todo_application/app/widgets/icons.dart';

class AddCard extends StatelessWidget {
  final homeCtrl = Get.find<HomeController>();
  AddCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final icons = getIcons();
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Wrap(
                        spacing: 2.0,
                        children: icons
                            .map((e) => Obx(() {
                                  final index = icons.indexOf(e);
                                  return ChoiceChip(
                                    selectedColor: Colors.grey[200],
                                    pressElevation: 0,
                                    backgroundColor: Colors.white,
                                    label: e,
                                    selected: homeCtrl.chipIndex.value == index,
                                    onSelected: (bool selected) {
                                      homeCtrl.chipIndex.value =
                                          selected ? index : 0;
                                    },
                                  );
                                }))
                            .toList(),
                      ),
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.indigoAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          minimumSize: Size(150, 50),
                        ),
                        onPressed: () {
                          if (homeCtrl.formkey.currentState!.validate()) {
                            int icon =
                                icons[homeCtrl.chipIndex.value].icon!.codePoint;
                            String color =
                                icons[homeCtrl.chipIndex.value].color!.toHex();
                            var task = Task(
                                title: homeCtrl.editCtrl.text,
                                icon: icon,
                                color: color);
                            Get.back();
                            homeCtrl.addTask(task)
                                ? EasyLoading.showSuccess('create status')
                                : EasyLoading.showError('duplicate task');
                          }
                        },
                        child: Text('OK')),
                  ],
                )),
          );
          homeCtrl.editCtrl.clear();
          homeCtrl.changeChipIndex(0);
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
