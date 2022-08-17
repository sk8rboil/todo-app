import 'package:flutter/material.dart';
import 'package:todo_application/app/core/values/icons.dart';

//List of Icon (person,work,movie,sport,travel,shop)

List<Icon> getIcons() {
  return const [
    Icon(
      IconData(personIcon, fontFamily: 'MaterialIcons'),
      color: Colors.purple,
    ),
    Icon(
      IconData(workIcon, fontFamily: 'MaterialIcons'),
      color: Colors.pink,
    ),
    Icon(IconData(movieIcon, fontFamily: 'MaterialIcons'), color: Colors.green),
    Icon(
      IconData(sportIcon, fontFamily: 'MaterialIcons'),
      color: Colors.yellow,
    ),
    Icon(
      IconData(travelIcon, fontFamily: 'MaterialIcons'),
      color: Colors.pinkAccent,
    ),
    Icon(
      IconData(shopIcon, fontFamily: 'MaterialIcons'),
      color: Colors.lightBlue,
    ),
  ];
}
