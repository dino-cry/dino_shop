import 'package:dino_shop/model/product.dart';
import 'package:dino_shop/pages/dino_cart_list/dino_cart_list_page.dart';
import 'package:dino_shop/pages/dino_cart_list/widgets/cart_item.dart';
import 'package:flutter/material.dart';

class CartItemsList extends StatelessWidget {
  const CartItemsList(
    List<Product> productList, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: ListView(
          children: [
            for (Product item in productList!) CartItem(item),
          ],
        ),
      ),
    );
  }
}
