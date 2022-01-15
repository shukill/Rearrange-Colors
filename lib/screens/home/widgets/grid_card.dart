import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rearrange/core/model/my_colors.dart';
import 'package:rearrange/screens/result/result_page.dart';

class GridCard extends StatelessWidget {
  const GridCard({
    Key? key,
    required this.myColor,
  }) : super(key: key);
  final MyColor myColor;

  @override
  Widget build(BuildContext context) {
    double luminace = myColor.color.computeLuminance();
    return InkWell(
      onTap: () {
        Get.to(() => ResultPage());
      },
      child: AnimatedContainer(
        key: key,
        duration: const Duration(milliseconds: 300),
        color: myColor.color,
        child: Center(
          child: Text(
            '${myColor.points}',
            style: TextStyle(
              color: (luminace < 0.5) ? Colors.white : Colors.black,
              fontSize: 24,
            ),
          ),
        ),
      ),
    );
  }
}
