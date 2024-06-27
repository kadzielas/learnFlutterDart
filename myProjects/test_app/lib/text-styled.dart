import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
  const StyledText(this.outputText, {super.key});

  final String outputText;

  @override
  Widget build(BuildContext context) {
    return Text(
      outputText,
      style: const TextStyle(color: Colors.black87, fontSize: 48),
      textAlign: TextAlign.center,
    );
  }
}
