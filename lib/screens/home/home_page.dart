import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/helpers.dart';
import '../result/result_page.dart';
import 'controller/home_controller.dart';
import 'widgets/normal_grid_view.dart';
import 'widgets/primary_button.dart';
import 'widgets/reorderable_grid_view.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

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
          padding: Helpers.screenPadding,
          height: Get.height,
          child: Obx(
            () {
              if (controller.enabled.isTrue) {
                return Column(
                  children: [
                    MyReorderableGridView(
                      controller: controller,
                    ),
                    PrimaryButton(
                      onTap: () {
                        controller.enabled.value = false;
                        Get.to(() => ResultPage());
                      },
                      title: Helpers.sumbit,
                    ),
                  ],
                );
              } else {
                return Column(
                  children: [
                    NormalGridView(
                      controller: controller,
                    ),
                    PrimaryButton(
                      onTap: () {
                        controller.resetList();
                      },
                      title: Helpers.reset,
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
