import 'package:dino_shop/pages/dino_register/dino_register_page.dart';
import 'package:flutter/material.dart';

class ProductPrice extends StatelessWidget {
  void Function(int price) setPrice;
  ProductPrice(this.setPrice);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '상품 가격',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: TextField(
                decoration: customInputDecoration(),
                cursorHeight: 25,
                cursorWidth: 1.5,
                cursorColor: Colors.black,
                style: Theme.of(context).textTheme.bodyMedium,
                keyboardType: TextInputType.numberWithOptions(),
                textAlign: TextAlign.end,
                onChanged: (text) => {
                  setPrice(int.parse(text)),
                },
              ),
            ),
            SizedBox(width: 10),
            Text('원'),
          ],
        ),
      ],
    );
  }
}
