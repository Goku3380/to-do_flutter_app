import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do/widgets/todo.dart';

final ColorScheme kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 177, 148, 243));

void main() {
  runApp(MaterialApp(
    theme: ThemeData().copyWith(
      useMaterial3: true,
      colorScheme: kColorScheme,
      cardTheme: const CardTheme().copyWith(
        color: const Color.fromARGB(255, 0, 0, 0),
        
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        )
      ),
      textTheme: TextTheme(
        titleLarge: GoogleFonts.inter(
          fontSize: 34,
          fontWeight: FontWeight.bold,
        ),
        titleMedium: GoogleFonts.inter(
          fontSize: 24,
          fontWeight: FontWeight.normal,

        ),
        titleSmall: GoogleFonts.inter(
          fontSize: 18,
          fontWeight: FontWeight.normal

        )
      )
    ),
    home: const ToDo(),
  ));
}
