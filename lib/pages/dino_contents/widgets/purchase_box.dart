import 'package:flutter/material.dart';

class PurchaseBox extends StatelessWidget {
  const PurchaseBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125,
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 100,
                  height: 40,
                  color: Colors.white,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.remove_rounded),
                        Text('1'),
                        Icon(Icons.add_rounded)
                      ],
                    ),
                  ),
                ),
                const Text(
                  '총 금액 : 16,000원',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17.5,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  width: 40,
                  height: 40,
                  color: Colors.white,
                  child: const Icon(Icons.add_shopping_cart_outlined),
                )
              ],
            ),
            const Spacer()
          ],
        ),
      ),
    );
  }
}
