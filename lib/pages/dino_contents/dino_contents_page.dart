import 'package:dino_shop/pages/dino_contents/widgets/product_list_view.dart';
import 'package:dino_shop/pages/dino_contents/widgets/purchase_box.dart';
import 'package:dino_shop/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DinoContentsPage(),
      themeMode: ThemeMode.system,
      theme: theme,
      darkTheme: darkTheme,
    );
  }
}

// 민트색 코드:32FAC5 노란색 코드:FFF068

class DinoContentsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dino Shop'),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      ),
      body: const Column(
        children: [
          Expanded(
            child: ProductListView(),
          ),
          PurchaseBox()
        ],
      ),
    );
  }
}
