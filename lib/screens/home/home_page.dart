import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rearrange/screens/home/controller/home_controller.dart';
import 'package:rearrange/screens/home/widgets/grid_card.dart';
import 'package:reorderable_grid_view/reorderable_grid_view.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: Get.height * 0.8,
          child: Obx(
            () {
              if (controller.enabled.isTrue) {
                return Column(
                  children: [
                    SizedBox(
                      height: Get.height * 0.5,
                      child: ReorderableGridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          crossAxisCount: 3,
                        ),
                        itemCount: controller.currentList.length,
                        itemBuilder: (context, index) {
                          Color myColor = controller.currentList[index];
                          return GridCard(
                            key: ValueKey(myColor),
                            color: myColor,
                          );
                        },
                        onReorder: (oldIndex, newIndex) {
                          controller.swap(oldIndex, newIndex);
                        },
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        controller.enabled.value = false;
                      },
                      child: const Text('Submit'),
                    ),
                  ],
                );
              } else {
                return NormalGridView(
                  controller: controller,
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

class NormalGridView extends StatelessWidget {
  const NormalGridView({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 3,
      children: controller.currentList.map((myColor) {
        return GridCard(
          key: ValueKey(myColor),
          color: myColor,
        );
      }).toList(),
    );
  }
}
