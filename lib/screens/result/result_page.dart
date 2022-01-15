import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rearrange/core/model/my_colors.dart';
import 'package:rearrange/screens/home/controller/home_controller.dart';
import 'package:rearrange/screens/result/widget/result_card.dart';

class ResultPage extends StatelessWidget {
  ResultPage({Key? key}) : super(key: key);
  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      appBar: AppBar(
        title: const Text('Result Page'),
      ),
      body: ListView.builder(
        itemCount: controller.currentList.length,
        padding: const EdgeInsets.symmetric(vertical: 20),
        itemBuilder: (context, index) {
          MyColor myColor = controller.currentList.elementAt(index);
          return ResultCard(
            key: ValueKey(myColor),
            index: index + 1,
            color: myColor,
          );
        },
      ),
    );
  }
}
