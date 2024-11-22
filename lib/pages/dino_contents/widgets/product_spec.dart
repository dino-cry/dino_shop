import 'package:flutter/material.dart';

class ProductSpec extends StatelessWidget {
  const ProductSpec({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(25),
          child: Align(
              alignment: Alignment.centerLeft,
              child:
                  Text('상품정보', style: TextStyle(fontWeight: FontWeight.bold))),
        ),
        Image.asset('assets/images/product/01.jpg')
      ],
    );
  }
}
