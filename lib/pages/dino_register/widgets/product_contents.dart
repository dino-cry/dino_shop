import 'package:dino_shop/constant.dart';
import 'package:dino_shop/pages/dino_register/dino_register_page.dart';
import 'package:dino_shop/pages/dino_register/widgets/product_regexp.dart';
import 'package:flutter/material.dart';

class ProductContents extends StatelessWidget {
  void Function(String contents) setContents;
  ProductContents(this.setContents);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '상품 설명',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        SizedBox(height: 8),
        TextFormField(
          decoration: customInputDecoration(),
          maxLines: 12,
          cursorHeight: 25,
          cursorWidth: 1.5,
          cursorColor: Colors.black,
          style: Theme.of(context).textTheme.bodyMedium,
          onChanged: (text) => {setContents(text)},
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
