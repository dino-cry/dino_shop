import 'package:flutter/material.dart';

final theme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
  cardColor: Colors.white,
  disabledColor: Colors.grey[300],
  appBarTheme: AppBarTheme(backgroundColor: Color(0xFFFFF068)),
  scaffoldBackgroundColor: Colors.white,
  dividerColor: Colors.grey,
  textTheme: const TextTheme(
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
      backgroundColor: const WidgetStatePropertyAll(Colors.purple),
      foregroundColor: const WidgetStatePropertyAll(Colors.white),
    ),
  ),
);
final darkTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.purple,
    brightness: Brightness.dark,
  ),
  cardColor: Colors.grey[800],
  disabledColor: Colors.grey[700],
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
      backgroundColor: const WidgetStatePropertyAll(Colors.purple),
      foregroundColor: const WidgetStatePropertyAll(Colors.white),
    ),
  ),
);
