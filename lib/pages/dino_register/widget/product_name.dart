import 'package:dino_shop/pages/dino_register/dino_register_page.dart';
import 'package:flutter/material.dart';

class ProductName extends StatelessWidget {
  String name;
  ProductName(this.name);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '상품 이름',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        SizedBox(height: 8),
        TextField(
          decoration: customInputDecoration(),
          cursorHeight: 25,
          cursorWidth: 1.5,
          cursorColor: Colors.black,
          style: Theme.of(context).textTheme.bodyMedium,
        )
      ],
    );
  }
}
