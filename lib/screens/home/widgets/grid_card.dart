import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rearrange/screens/result/result_page.dart';

class GridCard extends StatelessWidget {
  const GridCard({
    Key? key,
    required this.color,
  }) : super(key: key);
  final Color color;

  @override
  Widget build(BuildContext context) {
    double luminace = color.computeLuminance();
    return InkWell(
      onTap: () {
        Get.to(() => ResultPage());
      },
      child: AnimatedContainer(
        key: key,
        duration: const Duration(milliseconds: 300),
        color: color,
        child: Center(
          child: Text(
            '1',
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
