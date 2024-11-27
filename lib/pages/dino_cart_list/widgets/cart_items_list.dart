import 'package:dino_shop/model/cart.dart';
import 'package:dino_shop/model/product.dart';
import 'package:dino_shop/pages/dino_cart_list/widgets/cart_item.dart';
import 'package:flutter/material.dart';

class CartItemsList extends StatefulWidget {
  Cart userCart;

  void Function(Product item, bool isPositive) updateCartItem;
  void Function(Product item) removeCartItem;

  CartItemsList(this.userCart, this.updateCartItem, this.removeCartItem);

  @override
  State<CartItemsList> createState() => _CartItemsListState();
}

class _CartItemsListState extends State<CartItemsList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: ListView(
          children: [
            for (Product item in widget.userCart.cartItems.keys)
              CartItem(item, widget.userCart.cartItems[item]!,
                  widget.updateCartItem, widget.removeCartItem),
          ],
        ),
      ),
    );
  }
}
