import 'package:dino_shop/model/product.dart';
import 'package:dino_shop/pages/dino_cart_list/widgets/cart_items_list.dart';
import 'package:dino_shop/pages/dino_cart_list/widgets/cart_summary_bar.dart';
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
      home: DinoCartListPage(),
      themeMode: ThemeMode.system,
      theme: theme,
      darkTheme: darkTheme,
    );
  }
}

List<Product>? productList = [
  Product(
      name: "sample",
      price: 9000,
      contents: "Sample Content",
      image: ['assets/images/product/smaple_image.png']),
  Product(
      name: "sample",
      price: 9000,
      contents: "Sample Content",
      image: ['assets/images/product/smaple_image.png']),
  Product(
      name: "sample",
      price: 9000,
      contents: "Sample Content",
      image: ['assets/images/product/smaple_image.png']),
];

class DinoCartListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("장바구니"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // 장바구니 아이템 목록
          CartItemsList(productList!),

          // 구매 정보 박스
          CartSummaryBar(),
        ],
      ),
    );
  }
}