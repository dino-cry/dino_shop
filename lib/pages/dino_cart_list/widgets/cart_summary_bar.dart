import 'package:dino_shop/model/cart.dart';
import 'package:flutter/material.dart';

class CartSummaryBar extends StatefulWidget {
  Cart userCart;
  CartSummaryBar(this.userCart);

  @override
  State<CartSummaryBar> createState() => _CartSummaryBarState();
}

class _CartSummaryBarState extends State<CartSummaryBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      color: Colors.green,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("${widget.userCart.totalPrice}원"),
            OutlinedButton(
              onPressed: () {
                // 구매하기 함수
              },
              child: Text("구매하기"),
            ),
          ],
        ),
      ),
    );
  }
}
