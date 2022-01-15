import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rearrange/core/helpers.dart';
import 'package:rearrange/core/model/my_colors.dart';
import 'package:rearrange/screens/home/controller/home_controller.dart';
import 'package:rearrange/screens/home/widgets/grid_card.dart';
import 'package:rearrange/screens/result/result_page.dart';
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
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          Helpers.appBarTitle,
        ),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 50,
          ),
          height: Get.height,
          child: Obx(
            () {
              if (controller.enabled.isTrue) {
                return Column(
                  children: [
                    SizedBox(
                      height: Get.height * 0.6,
                      child: ReorderableGridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
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
                    ),
                    ElevatedButton(
                      onPressed: () {
                        controller.enabled.value = false;
                        Get.to(() => ResultPage());
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Helpers.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50,
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(Helpers.sumbit),
                      ),
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
          myColor: myColor,
        );
      }).toList(),
    );
  }
}
