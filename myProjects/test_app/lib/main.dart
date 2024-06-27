import 'package:flutter/material.dart';
import 'package:test_app/gradient-container.dart';

void main(List<String> args) {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: GradientContainer(
          color1: Colors.deepOrange,
          color2: Colors.yellow,
        ),
      ),
    ),
  );
}
