import 'package:flutter/material.dart';
import 'package:test_app/text-styled.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer(
      {super.key, required this.color1, required this.color2});

  final Color color1;
  final Color color2;

  const GradientContainer.orange({super.key})
      : color1 = Colors.deepOrange,
        color2 = Colors.yellow;

  @override
  Widget build(BuildContext context) {
    const String textTest1 = 'Application created by';
    const String textTest2 = ' Sebastian';
    const String textTest = textTest1 + textTest2;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [color1, color2],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
      ),
      child: const Center(
        child: StyledText(textTest),
      ),
    );
  }
}
