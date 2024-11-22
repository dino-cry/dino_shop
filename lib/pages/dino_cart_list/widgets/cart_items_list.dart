import 'package:dino_shop/model/product.dart';
import 'package:dino_shop/pages/dino_cart_list/cart.dart';
import 'package:dino_shop/pages/dino_cart_list/widgets/cart_item.dart';
import 'package:flutter/material.dart';

class CartItemsList extends StatefulWidget {
  Cart userCart;

  CartItemsList(this.userCart);

  @override
  State<CartItemsList> createState() => _CartItemsListState();
}

class _CartItemsListState extends State<CartItemsList> {
  void updateCartItem(Product item, bool isPositive) {
    setState(() {
      widget.userCart.updateCartItem(item, isPositive);
    });
  }

  void removeCartItem(Product item){
    setState(() {
      widget.userCart.removeCartItem(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: ListView(
          children: [
            for (Product item in widget.userCart.cartItems.keys)
              CartItem(item, widget.userCart.cartItems[item]!, updateCartItem, removeCartItem),
          ],
        ),
      ),
    );
  }
}
