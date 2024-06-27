import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(204, 22, 183, 127),
        body: Text(
          'Chuj',
          style: TextStyle(
              color: Colors.black,
              fontSize: 85,
              fontFamily: AutofillHints.nickname),
        ),
      ),
    ),
  );
}
