import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rearrange/core/model/my_colors.dart';

class HomeController extends GetxController {
  RxList currentList = [].obs;
  RxBool enabled = true.obs;

  @override
  void onInit() {
    if (currentList.isEmpty) {
      currentList.value = [
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
      ]; //Filling my global list with the initial value
    }
    super.onInit();
  }

  void swap(int oldInd, int newInd) {
    var temp = currentList.removeAt(oldInd);
    currentList.insert(newInd, temp);
    update();
  }
}
