import 'package:flutter/material.dart';
import 'package:rearrange/screens/result/helpers/result_helpers.dart';

class ResultCard extends StatelessWidget {
  const ResultCard({
    Key? key,
    required this.color,
    required this.index,
  }) : super(key: key);
  final Color color;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Row(
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
              color: color,
            ),
          ],
        ),
      ),
    );
  }
}
