import 'package:dino_shop/model/cart.dart';
import 'package:dino_shop/model/product.dart';
import 'package:dino_shop/pages/dino_cart_list/widgets/cart_items_list.dart';
import 'package:dino_shop/pages/dino_cart_list/widgets/cart_summary_bar.dart';
import 'package:dino_shop/theme.dart';
import 'package:flutter/material.dart';

Product sampleProduct = Product(
  name: "sample",
  price: 9000,
  contents: "Sample Content",
  image: ['assets/images/product/smaple_image.png'],
);
Product sampleProduct2 = Product(
  name: "sample1",
  price: 9000,
  contents: "Sample Content",
  image: ['assets/images/product/smaple_image.png'],
);
Product sampleProduct3 = Product(
  name: "sample2",
  price: 9000,
  contents: "Sample Content",
  image: ['assets/images/product/smaple_image.png'],
);
Product sampleProduct4 = Product(
  name: "sample3",
  price: 9000,
  contents: "Sample Content",
  image: ['assets/images/product/smaple_image.png'],
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Cart userCart = Cart();
    userCart.addItem(sampleProduct, 1);
    userCart.addItem(sampleProduct2, 2);
    userCart.addItem(sampleProduct3, 3);
    userCart.addItem(sampleProduct4, 4);
    userCart.calculateTotalPrice();

    return MaterialApp(
      home: DinoCartListPage(userCart),
      themeMode: ThemeMode.system,
      theme: theme,
      darkTheme: darkTheme,
    );
  }
}

class DinoCartListPage extends StatefulWidget {
  final Cart userCart;
  DinoCartListPage(this.userCart);

  @override
  State<DinoCartListPage> createState() => _DinoCartListPageState();
}

class _DinoCartListPageState extends State<DinoCartListPage> {
  void updateCartItem(Product item, bool isPositive) {
    setState(() {
      widget.userCart.updateCartItem(item, isPositive);
    });
  }

  void removeCartItem(Product item) {
    setState(() {
      widget.userCart.removeCartItem(item);
    });
  }

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
          CartItemsList(widget.userCart, updateCartItem, removeCartItem),

          // 구매 정보 박스
          CartSummaryBar(widget.userCart),
        ],
      ),
    );
  }
}
