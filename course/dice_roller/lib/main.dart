import 'package:flutter/material.dart';

import 'package:first_app/gradient_container.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: GradientContainer(const Color.fromARGB(255, 120, 100, 100),
            Color.fromARGB(255, 180, 0, 130)),
      ),
    ),
  );
}
