import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/home_controller.dart';
import 'grid_card.dart';

class NormalGridView extends StatelessWidget {
  const NormalGridView({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.65,
      child: GridView.count(
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 3,
        children: controller.currentList.map((myColor) {
          return GridCard(
            key: ValueKey(myColor),
            myColor: myColor,
          );
        }).toList(),
      ),
    );
  }
}
