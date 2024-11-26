import 'package:dino_shop/constant.dart';
import 'package:dino_shop/pages/dino_register/dino_register_page.dart';
import 'package:dino_shop/pages/dino_register/widget/product_regexp.dart';
import 'package:flutter/material.dart';

class ProductName extends StatelessWidget {
  void Function(String name) setName;
  ProductName(this.setName);

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
        TextFormField(
          decoration: customInputDecoration(),
          cursorHeight: 25,
          cursorWidth: 1.5,
          cursorColor: Colors.black,
          style: Theme.of(context).textTheme.bodyMedium,
          onChanged: (text) => {setName(text)},
          validator: (value) {
            if (value!.isEmpty) {
              return ONE_MORE_LETTER;
            }
            if (!ProductRegexp.str.hasMatch(value)) {
              return INVALID_LETTER;
            }
          },
        )
      ],
    );
  }
}
