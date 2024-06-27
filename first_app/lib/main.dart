import 'package:flutter/material.dart';

import 'package:first_app/gradient_container.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(163, 0, 229, 255),
        body: GradientContainer.orange(),
      ),
    ),
  );
}
