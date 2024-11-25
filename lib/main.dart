import 'package:dino_shop/model/cart.dart';
import 'package:dino_shop/pages/dino_list/dino_list_page.dart';
import 'package:dino_shop/pages/login/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DinoListPage(),
    );
  }
}
