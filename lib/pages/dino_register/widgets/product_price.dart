import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:dino_shop/constant.dart';
import 'package:dino_shop/pages/dino_register/dino_register_page.dart';
import 'package:dino_shop/pages/dino_register/widgets/product_regexp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProductPrice extends StatelessWidget {
  void Function(String price) setPrice;
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
              child: TextFormField(
                decoration: customInputDecoration(),
                cursorHeight: 25,
                cursorWidth: 1.5,
                cursorColor: Colors.black,
                style: Theme.of(context).textTheme.bodyMedium,
                keyboardType: TextInputType.numberWithOptions(),
                textAlign: TextAlign.end,
                inputFormatters: [
                  // 숫자 외 다른 글자 필터링
                  FilteringTextInputFormatter(
                    ProductRegexp.number,
                    allow: true,
                  ),
                  // 숫자 포맷(###,###)
                  CurrencyTextInputFormatter(MONEY_FORMAT)
                ],
                onChanged: (text) => {
                  if (text != '' && ProductRegexp.number.hasMatch(text))
                    {
                      text = text.replaceAll(',', ''),
                      setPrice(text),
                    }
                },
                // 빈 값 validation
                validator: (value) {
                  if (value!.isEmpty) {
                    return ONE_MORE_PRICE;
                  }
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
