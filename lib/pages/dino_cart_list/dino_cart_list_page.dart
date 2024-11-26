import 'package:dino_shop/constant.dart';
import 'package:dino_shop/model/cart.dart';
import 'package:dino_shop/model/product.dart';
import 'package:dino_shop/pages/dino_cart_list/widgets/cart_items_list.dart';
import 'package:dino_shop/pages/dino_cart_list/widgets/cart_summary_bar.dart';
import 'package:dino_shop/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class DinoCartListPage extends StatefulWidget {
  static String routeName = "/dinoCartList";

  @override
  State<DinoCartListPage> createState() => _DinoCartListPageState();
}

class _DinoCartListPageState extends State<DinoCartListPage> {
  Cart userCart = Cart();
  void updateCartItem(Product item, bool isPositive) {
    setState(() {
      userCart.updateCartItem(item, isPositive);
    });
  }

  void removeCartItem(Product item) {
    setState(() {
      userCart.removeCartItem(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "장바구니"),
      body: Column(
        children: [
          Container(
            height: 20,
          ),
          // 장바구니 아이템 목록
          userCart.cartItems.isEmpty
              ? EmptyCartMessage()
              : CartItemsList(userCart, updateCartItem, removeCartItem),

          // 구매 정보 박스
          CartSummaryBar(userCart),
        ],
      ),
    );
  }

  Widget EmptyCartMessage() {
    return Expanded(
      child: Center(
        child: Text(EMPTY_CART_MESSAGE),
      ),
    );
  }
}
