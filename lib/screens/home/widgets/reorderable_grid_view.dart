import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/model/my_colors.dart';
import '../controller/home_controller.dart';
import 'package:reorderable_grid_view/reorderable_grid_view.dart';

import 'grid_card.dart';

class MyReorderableGridView extends StatelessWidget {
  const MyReorderableGridView({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SizedBox(
        height: Get.height * 0.6,
        child: ReorderableGridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 3,
          ),
          itemCount: controller.currentList.length,
          itemBuilder: (context, index) {
            MyColor myColor = controller.currentList[index];
            return GridCard(
              key: ValueKey(myColor),
              myColor: myColor,
            );
          },
          onReorder: (oldInd, newInd) {
            controller.swap(oldInd, newInd);
          },
        ),
      );
    });
  }
}
