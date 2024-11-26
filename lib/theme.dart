import 'package:flutter/material.dart';

final theme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF45AA4A)),
  cardColor: Colors.white,
  disabledColor: Colors.grey[300],
  appBarTheme: AppBarTheme(
      titleTextStyle: TextStyle(
          color: Color(0xFF45AA4A),
          fontSize: 22.5,
          fontFamily: 'Paperlogy',
          fontWeight: FontWeight.w700),
      elevation: 0,
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Color(0xFF45AA4A))),
  scaffoldBackgroundColor: Colors.white,
  dividerColor: Colors.grey,
  fontFamily: 'Papaerlogy',
  textTheme: const TextTheme(
      // headlineLarge: TextStyle(fontSize: 50),
      // headlineMedium: TextStyle(fontSize: 50),
      // headlineSmall: TextStyle(fontSize: 50),
      bodyLarge: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      bodyMedium: TextStyle(fontSize: 20),
      bodySmall: TextStyle(fontSize: 15)),
  cardTheme: CardTheme(
      color: Colors.grey[200],
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      textStyle: const WidgetStatePropertyAll(
        TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: const WidgetStatePropertyAll(Color(0xFF45AA4A)),
      foregroundColor: const WidgetStatePropertyAll(Colors.white),
    ),
  ),
);
// final darkTheme = ThemeData(
//   colorScheme: ColorScheme.fromSeed(
//     seedColor: Colors.purple,
//     brightness: Brightness.dark,
//   ),
//   cardColor: Colors.grey[800],
//   disabledColor: Colors.grey[700],
//   elevatedButtonTheme: ElevatedButtonThemeData(
//     style: ButtonStyle(
//       shape: WidgetStatePropertyAll(
//         RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(20),
//         ),
//       ),
//       textStyle: const WidgetStatePropertyAll(
//         TextStyle(
//           fontSize: 18,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//       backgroundColor: const WidgetStatePropertyAll(Colors.purple),
//       foregroundColor: const WidgetStatePropertyAll(Colors.white),
//     ),
//   ),
// );
