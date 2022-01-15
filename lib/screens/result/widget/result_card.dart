import 'package:flutter/material.dart';
import '../../../core/model/my_colors.dart';
import '../helpers/result_helpers.dart';

class ResultCard extends StatelessWidget {
  const ResultCard({
    Key? key,
    required this.color,
    required this.index,
  }) : super(key: key);
  final MyColor color;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: 20,
            ),
            Text('$index'),
            const SizedBox(
              width: 20,
            ),
            Container(
              key: key,
              width: ResultHelpers.resultCardWidth,
              height: ResultHelpers.resultCardHeight,
              color: color.color,
            ),
            const SizedBox(
              width: 40,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${color.points} pts',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(color.name),
              ],
            )
          ],
        ),
      ),
    );
  }
}
