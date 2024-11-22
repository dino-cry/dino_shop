import 'package:flutter/material.dart';

class CartSummaryBar extends StatelessWidget {
  const CartSummaryBar({
    super.key,
  });

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
            Text("18,000원"),
            OutlinedButton(onPressed: () {}, child: Text("구매하기")),
          ],
        ),
      ),
    );
  }
}
