import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const double padding = 20.0;
const double margin = 8.0;
final theme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.light,
    seedColor: const Color.fromARGB(255, 26, 103, 80),
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);
