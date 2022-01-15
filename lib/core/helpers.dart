import 'package:flutter/material.dart';

import 'model/my_colors.dart';

class Helpers {
  static const Color red = Colors.red;
  static const Color amber = Colors.amber;
  static const Color blue = Colors.blue;
  static const Color green = Colors.green;
  static const Color black = Colors.black;
  static const Color cyan = Colors.cyan;
  static const Color purple = Colors.purple;
  static const Color pink = Colors.pinkAccent;
  static const Color teal = Colors.teal;

  List initialList = [
    MyColor(
      points: 10,
      color: Colors.red,
      name: 'Red',
    ),
    MyColor(
      points: 23,
      color: Colors.amber,
      name: 'Amber',
    ),
    MyColor(
      points: 7,
      color: Colors.blue,
      name: 'Blue',
    ),
    MyColor(
      points: 91,
      color: Colors.green,
      name: 'Green',
    ),
    MyColor(
      points: 11,
      color: Colors.black,
      name: 'Black',
    ),
    MyColor(
      points: 92,
      color: Colors.cyan,
      name: 'Cyan',
    ),
    MyColor(
      points: 7,
      color: Colors.purple,
      name: 'Purple',
    ),
    MyColor(
      points: 34,
      color: Colors.pinkAccent,
      name: 'Pink',
    ),
    MyColor(
      points: 83,
      color: Colors.teal,
      name: 'Teal',
    ),
  ];

  static const String appBarTitle = 'Rearrange Color';
  static const String sumbit = 'Submit';
  static const String reset = 'Reset';

  static const EdgeInsets screenPadding = EdgeInsets.symmetric(
    horizontal: 20,
    vertical: 50,
  );
}
